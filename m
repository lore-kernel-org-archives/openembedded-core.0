Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F3A0B606A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 08:55:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6E8tLhf029530
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 01:55:23 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 14 Jul 2016 01:55:17 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jul 2016 16:53:08 +0800
Message-ID: <ed54ec97e5ae0d42576c0c35a1950821bb168993.1468486311.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1468486311.git.kai.kang@windriver.com>
References: <cover.1468486311.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] perl: fix CVE-2016-2381
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
X-List-Received-Date: Thu, 14 Jul 2016 08:55:24 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2016-2381 from perl upstream:

http://perl5.git.perl.org/perl.git/commitdiff/ae37b791a73a9e78dedb89fb2429d2628cf58076

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../perl/perl/perl-fix-CVE-2016-2381.patch         | 113 +++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.22.1.bb          |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-2381.patch

diff --git a/meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-2381.patch b/meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-2381.patch
new file mode 100644
index 0000000..0033ae0
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-2381.patch
@@ -0,0 +1,113 @@
+Upstream-Status: Backport
+
+Backport patch to fix CVE-2016-2381 from
+
+http://perl5.git.perl.org/perl.git/commitdiff/ae37b791a73a9e78dedb89fb2429d2628cf58076
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From: Tony Cook <tony@develop-help.com>
+Date: Wed, 27 Jan 2016 00:52:15 +0000 (+1100)
+Subject: remove duplicate environment variables from environ
+X-Git-Tag: v5.23.9~170
+X-Git-Url: http://perl5.git.perl.org/perl.git/commitdiff_plain/ae37b791a73a9e78dedb89fb2429d2628cf58076
+
+remove duplicate environment variables from environ
+
+If we see duplicate environment variables while iterating over
+environ[]:
+
+a) make sure we use the same value in %ENV that getenv() returns.
+
+Previously on a duplicate, %ENV would have the last entry for the name
+from environ[], but a typical getenv() would return the first entry.
+
+Rather than assuming all getenv() implementations return the first entry
+explicitly call getenv() to ensure they agree.
+
+b) remove duplicate entries from environ
+
+Previously if there was a duplicate definition for a name in environ[]
+setting that name in %ENV could result in an unsafe value being passed
+to a child process, so ensure environ[] has no duplicates.
+
+CVE-2016-2381
+---
+
+diff --git a/perl.c b/perl.c
+index 4a324c6..5c71fd0 100644
+--- a/perl.c
++++ b/perl.c
+@@ -4329,23 +4329,70 @@ S_init_postdump_symbols(pTHX_ int argc, char **argv, char **env)
+ 	}
+ 	if (env) {
+ 	  char *s, *old_var;
++          STRLEN nlen;
+ 	  SV *sv;
++          HV *dups = newHV();
++
+ 	  for (; *env; env++) {
+ 	    old_var = *env;
+ 
+ 	    if (!(s = strchr(old_var,'=')) || s == old_var)
+ 		continue;
++            nlen = s - old_var;
+ 
+ #if defined(MSDOS) && !defined(DJGPP)
+ 	    *s = '\0';
+ 	    (void)strupr(old_var);
+ 	    *s = '=';
+ #endif
+-	    sv = newSVpv(s+1, 0);
+-	    (void)hv_store(hv, old_var, s - old_var, sv, 0);
++            if (hv_exists(hv, old_var, nlen)) {
++                const char *name = savepvn(old_var, nlen);
++
++                /* make sure we use the same value as getenv(), otherwise code that
++                   uses getenv() (like setlocale()) might see a different value to %ENV
++                 */
++                sv = newSVpv(PerlEnv_getenv(name), 0);
++
++                /* keep a count of the dups of this name so we can de-dup environ later */
++                if (hv_exists(dups, name, nlen))
++                    ++SvIVX(*hv_fetch(dups, name, nlen, 0));
++                else
++                    (void)hv_store(dups, name, nlen, newSViv(1), 0);
++
++                Safefree(name);
++            }
++            else {
++                sv = newSVpv(s+1, 0);
++            }
++	    (void)hv_store(hv, old_var, nlen, sv, 0);
+ 	    if (env_is_not_environ)
+ 	        mg_set(sv);
+ 	  }
++          if (HvKEYS(dups)) {
++              /* environ has some duplicate definitions, remove them */
++              HE *entry;
++              hv_iterinit(dups);
++              while ((entry = hv_iternext_flags(dups, 0))) {
++                  STRLEN nlen;
++                  const char *name = HePV(entry, nlen);
++                  IV count = SvIV(HeVAL(entry));
++                  IV i;
++                  SV **valp = hv_fetch(hv, name, nlen, 0);
++
++                  assert(valp);
++
++                  /* try to remove any duplicate names, depending on the
++                   * implementation used in my_setenv() the iteration might
++                   * not be necessary, but let's be safe.
++                   */
++                  for (i = 0; i < count; ++i)
++                      my_setenv(name, 0);
++
++                  /* and set it back to the value we set $ENV{name} to */
++                  my_setenv(name, SvPV_nolen(*valp));
++              }
++          }
++          SvREFCNT_dec_NN(dups);
+       }
+ #endif /* USE_ENVIRON_ARRAY */
+ #endif /* !PERL_MICRO */
diff --git a/meta/recipes-devtools/perl/perl_5.22.1.bb b/meta/recipes-devtools/perl/perl_5.22.1.bb
index 3bd0a6d..04a2b6f 100644
--- a/meta/recipes-devtools/perl/perl_5.22.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.1.bb
@@ -65,6 +65,7 @@ SRC_URI += " \
         file://perl-errno-generation-gcc5.patch \
         file://perl-fix-conflict-between-skip_all-and-END.patch \
         file://perl-test-customized.patch \
+        file://perl-fix-CVE-2016-2381.patch \
 "
 
 # Fix test case issues
-- 
2.6.1


