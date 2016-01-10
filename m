Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 09CA073CBD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:39:35 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id n128so2208104pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=8ND6e8jOqWvLezkE1H8WcsXzqHAwsgKLr6+8sLaZGKw=;
	b=uNKggwVfLObRTQz14gkfnvk5cu8/YI2TDI0c084SjzDq02x2X2YgKu9UgWBPbBSSBI
	sNXUdvs14gn4yES8S3d+BFb0dhuBqL+JBtqmIKpfLhatyIxkb+pv8UAkrLj2cyXGvSbf
	SzwTYMIdDunALeCGvS32luUxUS4q94fhAtOOrr5kirUVcWd+UNAJIU034FdWHjzbHOOj
	nTUFuWIo6ojfWxIYR3V8DE37YCzlDHdV8n6fOavmtbWeuyHWdq0MXQ4JuRIa5QX/x7Rp
	w0JzfJQHGeke9VOW3ctNV+8sUAJn8Pp0GvAi93+Nq7yoN6j0VXQQADLMIai3SgmALTnl
	graQ==
X-Received: by 10.98.31.151 with SMTP id l23mr15886084pfj.76.1452386376375;
	Sat, 09 Jan 2016 16:39:36 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	v2sm13722537pfi.93.2016.01.09.16.39.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:39:34 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 41342FCC84C; Sat,  9 Jan 2016 16:30:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:30:46 -0800
Message-Id: <7a99aa9ea73d5d12d73599c860644fc28efd5135.1452385572.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
Subject: [PATCH 20/20] bind: CVE-2015-8000
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
X-List-Received-Date: Sun, 10 Jan 2016 00:39:36 -0000

From: Sona Sarmadi <sona.sarmadi@enea.com>

Fixes a denial of service in BIND.

An error in the parsing of incoming responses allows some
records with an incorrect class to be accepted by BIND
instead of being rejected as malformed. This can trigger
a REQUIRE assertion failure when those records are subsequently
cached.

[YOCTO #8838]

References:
http://www.openwall.com/lists/oss-security/2015/12/15/14
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-8000
https://bugzilla.redhat.com/attachment.cgi?id=1105581

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../bind/bind/CVE-2015-8000.patch                  | 194 +++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |   1 +
 2 files changed, 195 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8000.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2015-8000.patch b/meta/recipes-connectivity/bind/bind/CVE-2015-8000.patch
new file mode 100644
index 0000000..b8d8412
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2015-8000.patch
@@ -0,0 +1,194 @@
+responses with a malformed class attribute can trigger an
+assertion failure in db.c
+
+[security]
+Insufficient testing when parsing a message allowed records with
+an incorrect class to be be accepted, triggering a REQUIRE failure
+when those records were subsequently cached. (CVE-2015-8000) [RT#4098]
+
+Upstream-Status: Backport
+
+[The patch is taken from BIND 9.9.4:
+https://bugzilla.redhat.com/attachment.cgi?id=1105581]
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+diff --git a/lib/dns/include/dns/message.h b/lib/dns/include/dns/message.h
+index a6862fa..d999e75 100644
+--- a/lib/dns/include/dns/message.h
++++ b/lib/dns/include/dns/message.h
+@@ -210,6 +210,8 @@ struct dns_message {
+ 	unsigned int			verify_attempted : 1;
+ 	unsigned int			free_query : 1;
+ 	unsigned int			free_saved : 1;
++	unsigned int			tkey : 1;
++	unsigned int			rdclass_set : 1;
+ 
+ 	unsigned int			opt_reserved;
+ 	unsigned int			sig_reserved;
+@@ -1374,6 +1376,15 @@ dns_message_buildopt(dns_message_t *msg, dns_rdataset_t **opt,
+  * \li	 other.
+  */
+ 
++void
++dns_message_setclass(dns_message_t *msg, dns_rdataclass_t rdclass);
++/*%<
++ * Set the expected class of records in the response.
++ *
++ * Requires:
++ * \li   msg be a valid message with parsing intent.
++ */
++
+ ISC_LANG_ENDDECLS
+ 
+ #endif /* DNS_MESSAGE_H */
+diff --git a/lib/dns/message.c b/lib/dns/message.c
+index 53efc5a..73def73 100644
+--- a/lib/dns/message.c
++++ b/lib/dns/message.c
+@@ -436,6 +436,8 @@ msginit(dns_message_t *m) {
+ 	m->saved.base = NULL;
+ 	m->saved.length = 0;
+ 	m->free_saved = 0;
++	m->tkey = 0;
++	m->rdclass_set = 0;
+ 	m->querytsig = NULL;
+ }
+ 
+@@ -1086,13 +1088,19 @@ getquestions(isc_buffer_t *source, dns_message_t *msg, dns_decompress_t *dctx,
+ 		 * If this class is different than the one we already read,
+ 		 * this is an error.
+ 		 */
+-		if (msg->state == DNS_SECTION_ANY) {
+-			msg->state = DNS_SECTION_QUESTION;
++		if (msg->rdclass_set == 0) {
+ 			msg->rdclass = rdclass;
++			msg->rdclass_set = 1;
+ 		} else if (msg->rdclass != rdclass)
+ 			DO_FORMERR;
+ 
+ 		/*
++		 * Is this a TKEY query?
++		 */
++		if (rdtype == dns_rdatatype_tkey)
++			msg->tkey = 1;
++
++		/*
+ 		 * Can't ask the same question twice.
+ 		 */
+ 		result = dns_message_find(name, rdclass, rdtype, 0, NULL);
+@@ -1236,12 +1244,12 @@ getsection(isc_buffer_t *source, dns_message_t *msg, dns_decompress_t *dctx,
+ 		 * If there was no question section, we may not yet have
+ 		 * established a class.  Do so now.
+ 		 */
+-		if (msg->state == DNS_SECTION_ANY &&
++		if (msg->rdclass_set == 0 &&
+ 		    rdtype != dns_rdatatype_opt &&	/* class is UDP SIZE */
+ 		    rdtype != dns_rdatatype_tsig &&	/* class is ANY */
+ 		    rdtype != dns_rdatatype_tkey) {	/* class is undefined */
+ 			msg->rdclass = rdclass;
+-			msg->state = DNS_SECTION_QUESTION;
++			msg->rdclass_set = 1;
+ 		}
+ 
+ 		/*
+@@ -1251,7 +1259,7 @@ getsection(isc_buffer_t *source, dns_message_t *msg, dns_decompress_t *dctx,
+ 		if (msg->opcode != dns_opcode_update
+ 		    && rdtype != dns_rdatatype_tsig
+ 		    && rdtype != dns_rdatatype_opt
+-		    && rdtype != dns_rdatatype_dnskey /* in a TKEY query */
++		    && rdtype != dns_rdatatype_key /* in a TKEY query */
+ 		    && rdtype != dns_rdatatype_sig /* SIG(0) */
+ 		    && rdtype != dns_rdatatype_tkey /* Win2000 TKEY */
+ 		    && msg->rdclass != dns_rdataclass_any
+@@ -1259,6 +1267,16 @@ getsection(isc_buffer_t *source, dns_message_t *msg, dns_decompress_t *dctx,
+ 			DO_FORMERR;
+ 
+ 		/*
++		 * If this is not a TKEY query/response then the KEY
++		 * record's class needs to match.
++		 */
++		if (msg->opcode != dns_opcode_update && !msg->tkey &&
++		    rdtype == dns_rdatatype_key &&
++		    msg->rdclass != dns_rdataclass_any &&
++		    msg->rdclass != rdclass)
++			DO_FORMERR;
++
++		/*
+ 		 * Special type handling for TSIG, OPT, and TKEY.
+ 		 */
+ 		if (rdtype == dns_rdatatype_tsig) {
+@@ -1372,6 +1390,10 @@ getsection(isc_buffer_t *source, dns_message_t *msg, dns_decompress_t *dctx,
+ 				skip_name_search = ISC_TRUE;
+ 				skip_type_search = ISC_TRUE;
+ 				issigzero = ISC_TRUE;
++			} else {
++				if (msg->rdclass != dns_rdataclass_any &&
++				    msg->rdclass != rdclass)
++					DO_FORMERR;
+ 			}
+ 		} else
+ 			covers = 0;
+@@ -1610,6 +1632,7 @@ dns_message_parse(dns_message_t *msg, isc_buffer_t *source,
+ 	msg->counts[DNS_SECTION_ADDITIONAL] = isc_buffer_getuint16(source);
+ 
+ 	msg->header_ok = 1;
++	msg->state = DNS_SECTION_QUESTION;
+ 
+ 	/*
+ 	 * -1 means no EDNS.
+@@ -3550,3 +3573,15 @@ dns_message_buildopt(dns_message_t *message, dns_rdataset_t **rdatasetp,
+ 		dns_message_puttemprdatalist(message, &rdatalist);
+ 	return (result);
+ }
++
++void
++dns_message_setclass(dns_message_t *msg, dns_rdataclass_t rdclass) {
++
++	REQUIRE(DNS_MESSAGE_VALID(msg));
++	REQUIRE(msg->from_to_wire == DNS_MESSAGE_INTENTPARSE);
++	REQUIRE(msg->state == DNS_SECTION_ANY);
++	REQUIRE(msg->rdclass_set == 0);
++
++	msg->rdclass = rdclass;
++	msg->rdclass_set = 1;
++}
+diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
+index aa23b11..d220986 100644
+--- a/lib/dns/resolver.c
++++ b/lib/dns/resolver.c
+@@ -6964,6 +6964,8 @@ resquery_response(isc_task_t *task, isc_event_t *event) {
+ 			goto done;
+ 	}
+ 
++	dns_message_setclass(message, fctx->res->rdclass);
++
+ 	result = dns_message_parse(message, &devent->buffer, 0);
+ 	if (result != ISC_R_SUCCESS) {
+ 		switch (result) {
+@@ -7036,6 +7038,12 @@ resquery_response(isc_task_t *task, isc_event_t *event) {
+ 	 */
+ 	log_packet(message, ISC_LOG_DEBUG(10), fctx->res->mctx);
+ 
++	if (message->rdclass != fctx->res->rdclass) {
++		resend = ISC_TRUE;
++		FCTXTRACE("bad class");
++		goto done;
++	}
++
+ 	/*
+ 	 * Process receive opt record.
+ 	 */
+diff --git a/lib/dns/xfrin.c b/lib/dns/xfrin.c
+index 9ad8960..938373a 100644
+--- a/lib/dns/xfrin.c
++++ b/lib/dns/xfrin.c
+@@ -1241,6 +1241,8 @@ xfrin_recv_done(isc_task_t *task, isc_event_t *ev) {
+ 	msg->tsigctx = xfr->tsigctx;
+ 	xfr->tsigctx = NULL;
+ 
++	dns_message_setclass(msg, xfr->rdclass);
++
+ 	if (xfr->nmsg > 0)
+ 		msg->tcp_continuation = 1;
+ 
diff --git a/meta/recipes-connectivity/bind/bind_9.9.5.bb b/meta/recipes-connectivity/bind/bind_9.9.5.bb
index ee94011..6e4878d 100644
--- a/meta/recipes-connectivity/bind/bind_9.9.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.9.5.bb
@@ -22,6 +22,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
 	   file://CVE-2015-1349.patch \ 
 	   file://CVE-2015-4620.patch \
 	   file://CVE-2015-5722.patch \
+           file://CVE-2015-8000.patch \
 	   "
 
 SRC_URI[md5sum] = "e676c65cad5234617ee22f48e328c24e"
-- 
1.9.1


