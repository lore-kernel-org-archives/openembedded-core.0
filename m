Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 49B9974585
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 18:35:33 +0000 (UTC)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [40.117.60.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2E7F92086B;
	Mon, 24 Sep 2018 18:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1537814134;
	bh=HIQlKs1i4/G1wfvdqptp932f4SnI9HH/d2/Xqk6nOyU=;
	h=From:To:Cc:Subject:Date:From;
	b=dRA6/u9jSRF7R9gx7cruM7d509VN+IYiPcUjeEUMxe9vijg4KU1b9PGLO4a/TfgLN
	kS5V8yOLTSMJPFtAUCCMeWsaRvnOj78AkJRCP+HJz94nMcMEcykyG5tDqvzLF5UdD+
	W3Va+z6IS+iqMgf6cW6BRYbo5K2rWVN+nScLVdAk=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2018 18:35:31 +0000
Message-Id: <20180924183531.21528-1-okaya@kernel.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [sumo] [meta-networking] [PATCH v1] dnsmasq: CVE-2017-15107
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2018 18:35:33 -0000
Content-Transfer-Encoding: 8bit

* CVE-2017-15107
A vulnerability was found in Dnsmasq's implementation of DNSSEC.
Wildcard synthesized NSEC records could be improperly interpreted
to prove the non-existence of hostnames that actually exist.

Affects dnsmasq <= 2.78

CVE: CVE-2017-15107
Ref: https://access.redhat.com/security/cve/cve-2017-15107
Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../recipes-support/dnsmasq/dnsmasq_2.78.bb   |   1 +
 .../dnsmasq/files/CVE-2017-15107.patch        | 262 ++++++++++++++++++
 2 files changed, 263 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2017-15107.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.78.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.78.bb
index 4d1dc6e69..d2465f82d 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.78.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.78.bb
@@ -2,6 +2,7 @@ require dnsmasq.inc
 
 SRC_URI += "\
     file://lua.patch \
+    file://CVE-2017-15107.patch \
 "
 
 SRC_URI[dnsmasq-2.78.md5sum] = "3bb97f264c73853f802bf70610150788"
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2017-15107.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2017-15107.patch
new file mode 100644
index 000000000..da2af56cf
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2017-15107.patch
@@ -0,0 +1,262 @@
+From 5a56e1b78a753d3295564daddc9ce389cc69fd68 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Fri, 19 Jan 2018 12:26:08 +0000
+Subject: [PATCH] DNSSEC fix for wildcard NSEC records. CVE-2017-15107 applies.
+
+It's OK for NSEC records to be expanded from wildcards,
+but in that case, the proof of non-existence is only valid
+starting at the wildcard name, *.<domain> NOT the name expanded
+from the wildcard. Without this check it's possible for an
+attacker to craft an NSEC which wrongly proves non-existence
+in a domain which includes a wildcard for NSEC.
+
+Upstream-Status: Backport [http://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=4fe6744a220eddd3f1749b40cac3dfc510787de6]
+Signed-off-by: Sinan Kaya <okaya@kernel.org>
+---
+ CHANGELOG    |  44 +++++++++++++++++++
+ src/dnssec.c | 117 +++++++++++++++++++++++++++++++++++++++++++++------
+ 2 files changed, 147 insertions(+), 14 deletions(-)
+
+diff --git a/CHANGELOG b/CHANGELOG
+index 075fe1a6..5226dce8 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -1,3 +1,47 @@
++version 2.79
++	Fix parsing of CNAME arguments, which are confused by extra spaces.
++	Thanks to Diego Aguirre for spotting the bug.
++
++	Where available, use IP_UNICAST_IF or IPV6_UNICAST_IF to bind
++	upstream servers to an interface, rather than SO_BINDTODEVICE.
++	Thanks to Beniamino Galvani for the patch.
++
++	Always return a SERVFAIL answer to DNS queries without the
++	recursion desired bit set, UNLESS acting as an authoritative
++	DNS server. This avoids a potential route to cache snooping.
++
++	Add support for Ed25519 signatures in DNSSEC validation.
++
++	No longer support RSA/MD5 signatures in DNSSEC validation,
++	since these are not secure. This behaviour is mandated in
++	RFC-6944.
++
++	Fix incorrect error exit code from dhcp_release6 utility.
++	Thanks Gaudenz Steinlin for the bug report.
++
++	Use SIGINT (instead of overloading SIGHUP) to turn on DNSSEC
++	time validation when --dnssec-no-timecheck is in use.
++	Note that this is an incompatible change from earlier releases.
++
++	Allow more than one --bridge-interface option to refer to an
++	interface, so that we can use
++	--bridge-interface=int1,alias1
++	--bridge-interface=int1,alias2
++	as an alternative to
++	--bridge-interface=int1,alias1,alias2
++	Thanks to Neil Jerram for work on this.
++
++	Fix for DNSSEC with wildcard-derived NSEC records.
++	It's OK for NSEC records to be expanded from wildcards,
++	but in that case, the proof of non-existence is only valid
++	starting at the wildcard name, *.<domain> NOT the name expanded
++	from the wildcard. Without this check it's possible for an
++	attacker to craft an NSEC which wrongly proves non-existence.
++	Thanks to Ralph Dolmans for finding this, and co-ordinating 
++	the vulnerability tracking and fix release.
++	CVE-2017-15107 applies.
++
++
+ version 2.78
+         Fix logic of appending ".<layer>" to PXE basename. Thanks to Chris
+ 	Novakovic for the patch.
+diff --git a/src/dnssec.c b/src/dnssec.c
+index a74d01ab..1417be56 100644
+--- a/src/dnssec.c
++++ b/src/dnssec.c
+@@ -424,15 +424,17 @@ static void from_wire(char *name)
+ static int count_labels(char *name)
+ {
+   int i;
+-
++  char *p;
++  
+   if (*name == 0)
+     return 0;
+ 
+-  for (i = 0; *name; name++)
+-    if (*name == '.')
++  for (p = name, i = 0; *p; p++)
++    if (*p == '.')
+       i++;
+ 
+-  return i+1;
++  /* Don't count empty first label. */
++  return *name == '.' ? i : i+1;
+ }
+ 
+ /* Implement RFC1982 wrapped compare for 32-bit numbers */
+@@ -1405,8 +1407,8 @@ static int hostname_cmp(const char *a, const char *b)
+     }
+ }
+ 
+-static int prove_non_existence_nsec(struct dns_header *header, size_t plen, unsigned char **nsecs, int nsec_count,
+-				    char *workspace1, char *workspace2, char *name, int type, int *nons)
++static int prove_non_existence_nsec(struct dns_header *header, size_t plen, unsigned char **nsecs, unsigned char **labels, int nsec_count,
++				    char *workspace1_in, char *workspace2, char *name, int type, int *nons)
+ {
+   int i, rc, rdlen;
+   unsigned char *p, *psave;
+@@ -1419,6 +1421,9 @@ static int prove_non_existence_nsec(struct dns_header *header, size_t plen, unsi
+   /* Find NSEC record that proves name doesn't exist */
+   for (i = 0; i < nsec_count; i++)
+     {
++      char *workspace1 = workspace1_in;
++      int sig_labels, name_labels;
++
+       p = nsecs[i];
+       if (!extract_name(header, plen, &p, workspace1, 1, 10))
+ 	return 0;
+@@ -1427,7 +1432,27 @@ static int prove_non_existence_nsec(struct dns_header *header, size_t plen, unsi
+       psave = p;
+       if (!extract_name(header, plen, &p, workspace2, 1, 10))
+ 	return 0;
+-      
++
++      /* If NSEC comes from wildcard expansion, use original wildcard
++	 as name for computation. */
++      sig_labels = *labels[i];
++      name_labels = count_labels(workspace1);
++
++      if (sig_labels < name_labels)
++	{
++	  int k;
++	  for (k = name_labels - sig_labels; k != 0; k--)
++	    {
++	      while (*workspace1 != '.' && *workspace1 != 0)
++		workspace1++;
++	      if (k != 1 && *workspace1 == '.')
++		workspace1++;
++	    }
++	  
++	  workspace1--;
++	  *workspace1 = '*';
++	}
++	  
+       rc = hostname_cmp(workspace1, name);
+       
+       if (rc == 0)
+@@ -1825,24 +1850,26 @@ static int prove_non_existence_nsec3(struct dns_header *header, size_t plen, uns
+ 
+ static int prove_non_existence(struct dns_header *header, size_t plen, char *keyname, char *name, int qtype, int qclass, char *wildname, int *nons)
+ {
+-  static unsigned char **nsecset = NULL;
+-  static int nsecset_sz = 0;
++  static unsigned char **nsecset = NULL, **rrsig_labels = NULL;
++  static int nsecset_sz = 0, rrsig_labels_sz = 0;
+   
+   int type_found = 0;
+-  unsigned char *p = skip_questions(header, plen);
++  unsigned char *auth_start, *p = skip_questions(header, plen);
+   int type, class, rdlen, i, nsecs_found;
+   
+   /* Move to NS section */
+   if (!p || !(p = skip_section(p, ntohs(header->ancount), header, plen)))
+     return 0;
++
++  auth_start = p;
+   
+   for (nsecs_found = 0, i = ntohs(header->nscount); i != 0; i--)
+     {
+       unsigned char *pstart = p;
+       
+-      if (!(p = skip_name(p, header, plen, 10)))
++      if (!extract_name(header, plen, &p, daemon->workspacename, 1, 10))
+ 	return 0;
+-      
++	  
+       GETSHORT(type, p); 
+       GETSHORT(class, p);
+       p += 4; /* TTL */
+@@ -1859,7 +1886,69 @@ static int prove_non_existence(struct dns_header *header, size_t plen, char *key
+ 	  if (!expand_workspace(&nsecset, &nsecset_sz, nsecs_found))
+ 	    return 0; 
+ 	  
+-	  nsecset[nsecs_found++] = pstart;
++	  if (type == T_NSEC)
++	    {
++	      /* If we're looking for NSECs, find the corresponding SIGs, to 
++		 extract the labels value, which we need in case the NSECs
++		 are the result of wildcard expansion.
++		 Note that the NSEC may not have been validated yet
++		 so if there are multiple SIGs, make sure the label value
++		 is the same in all, to avoid be duped by a rogue one.
++		 If there are no SIGs, that's an error */
++	      unsigned char *p1 = auth_start;
++	      int res, j, rdlen1, type1, class1;
++	      
++	      if (!expand_workspace(&rrsig_labels, &rrsig_labels_sz, nsecs_found))
++		return 0;
++	      
++	      rrsig_labels[nsecs_found] = NULL;
++	      
++	      for (j = ntohs(header->nscount); j != 0; j--)
++		{
++		  if (!(res = extract_name(header, plen, &p1, daemon->workspacename, 0, 10)))
++		    return 0;
++
++		   GETSHORT(type1, p1); 
++		   GETSHORT(class1, p1);
++		   p1 += 4; /* TTL */
++		   GETSHORT(rdlen1, p1);
++
++		   if (!CHECK_LEN(header, p1, plen, rdlen1))
++		     return 0;
++		   
++		   if (res == 1 && class1 == qclass && type1 == T_RRSIG)
++		     {
++		       int type_covered;
++		       unsigned char *psav = p1;
++		       
++		       if (rdlen < 18)
++			 return 0; /* bad packet */
++
++		       GETSHORT(type_covered, p1);
++
++		       if (type_covered == T_NSEC)
++			 {
++			   p1++; /* algo */
++			   
++			   /* labels field must be the same in every SIG we find. */
++			   if (!rrsig_labels[nsecs_found])
++			     rrsig_labels[nsecs_found] = p1;
++			   else if (*rrsig_labels[nsecs_found] != *p1) /* algo */
++			     return 0;
++			   }
++		       p1 = psav;
++		     }
++		   
++		   if (!ADD_RDLEN(header, p1, plen, rdlen1))
++		     return 0;
++		}
++
++	      /* Must have found at least one sig. */
++	      if (!rrsig_labels[nsecs_found])
++		return 0;
++	    }
++
++	  nsecset[nsecs_found++] = pstart;   
+ 	}
+       
+       if (!ADD_RDLEN(header, p, plen, rdlen))
+@@ -1867,7 +1956,7 @@ static int prove_non_existence(struct dns_header *header, size_t plen, char *key
+     }
+   
+   if (type_found == T_NSEC)
+-    return prove_non_existence_nsec(header, plen, nsecset, nsecs_found, daemon->workspacename, keyname, name, qtype, nons);
++    return prove_non_existence_nsec(header, plen, nsecset, rrsig_labels, nsecs_found, daemon->workspacename, keyname, name, qtype, nons);
+   else if (type_found == T_NSEC3)
+     return prove_non_existence_nsec3(header, plen, nsecset, nsecs_found, daemon->workspacename, keyname, name, qtype, wildname, nons);
+   else
+-- 
+2.19.0
+
-- 
2.19.0


