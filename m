Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
	by mail.openembedded.org (Postfix) with ESMTP id 25F766079F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 04:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2609; q=dns/txt; s=iport;
	t=1540529591; x=1541739191;
	h=from:to:cc:subject:date:message-id;
	bh=mouK3usr1lOlxE32Gn2beLo/zAzZEM8REEFwjQ9f/U4=;
	b=eRfv2p4I/JbhtFwKkoVLBX4yYrAp3z0jp3w+tieiCRaDJh6p/5nzFVMj
	MMCHAu/IfnniZ4TN+HZUJjMUl6iRX+Y+FFle56eVw6VMgNz0UFUDA2wy8
	f4TMVqjeJR/fpwsGXVKSIIO+v+PdgLUYuEyXnaYswCzPpHy1FmGierifa 8=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AmAAAzndJb/4MNJK1jHAEBAQQBAQc?=
	=?us-ascii?q?EAQGBUQcBAQsBggSBZSiMDYwXmSmBegsBAYRsgxMhNA0NAQMBAQIBAQJtKIU?=
	=?us-ascii?q?8BHoFgUyDIYF6CKhnih2HQYQmF4IAiW6FDgKIZj+GLI8qCYoIhmwLGIFSjnE?=
	=?us-ascii?q?BiTKNNwIEBgUCFIFDOIFVTSMVgyeQdx8wjSkBAQ?=
X-IronPort-AV: E=Sophos;i="5.54,426,1534809600"; d="scan'208";a="387071261"
Received: from alln-core-1.cisco.com ([173.36.13.131])
	by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Oct 2018 04:53:10 +0000
Received: from kamensky-w541.cisco.com ([10.24.44.84]) (authenticated bits=0)
	by alln-core-1.cisco.com (8.15.2/8.15.2) with ESMTPSA id w9Q4r5Ut011032
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); 
	Fri, 26 Oct 2018 04:53:10 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Oct 2018 21:53:03 -0700
Message-Id: <20181026045303.10592-1-kamensky@cisco.com>
X-Mailer: git-send-email 2.17.2
X-Authenticated-User: kamensky@cisco.com
X-Outbound-SMTP-Client: 10.24.44.84, [10.24.44.84]
X-Outbound-Node: alln-core-1.cisco.com
Subject: [PATCH] sysklogd: add alternatives for klogd and syslogd
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
X-List-Received-Date: Fri, 26 Oct 2018 04:53:10 -0000

Otherwise when used in presense of busybox that provides
its own version of klogd and syslogd, image packaging
complains that klogd exists and it is not syymbolic link.
Failure happens only if image packaging script install
sysklogd package first followed by installtion of busybox
package. If during packaging reverse installtion order
happens, busybox first followed by sysklogd, packaging
succeed.

Note this fix along with recently committed
55ba9dc1f8 sysklogd: Re-enable alternatives for syslogd.8 man page
effectively reverts this commit
988aad01b2 sysklogd: don't use update-alternatives

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
Hi Guys,

Here is more details. Example of failure that I observe:

update-alternatives: Error: not linking /home/wd8/oe/20181021/build/tmp-glibc/work/intel_corei7_64-oe-linux/kdevel-console-devel-image/1.0-r0/rootfs/sbin/klogd to /usr/lib/busybox/sbin/klogd since /home/wd8/oe/20181021/build/tmp-glibc/work/intel_corei7_64-oe-linux/kdevel-console-devel-image/1.0-r0/rootfs/sbin/klogd exists and is not a link

Also 988aad01b2 says:

> Using update-alternatives for managing init scripts has proved to be
> problematic. And, sysklogd rconflicts with other syslog daemons so there
> is no point in using update-alternatives from this perspective, either.

I am not sure why "managing init scripts has proved to be problematic" and
syslogd and klogd are not really init script per se, aren't they? Also
klogd and syslogd actually come from busybox, not busybox-syslog as listed
in sysklogd RCONFLICTS. Maybe it what has changed since 988aad01b2.
busybox-syslog now contains only init script for syslog and its
configuration.

Adding Markus for further comments.

 meta/recipes-extended/sysklogd/sysklogd.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index f151dd87f7..4393a39180 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -60,9 +60,14 @@ FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}
 
 ALTERNATIVE_PRIORITY = "100"
 
+ALTERNATIVE_${PN} = "syslogd klogd"
+
 ALTERNATIVE_${PN}-doc = "syslogd.8"
 ALTERNATIVE_LINK_NAME[syslogd.8] = "${mandir}/man8/syslogd.8"
 
+ALTERNATIVE_LINK_NAME[syslogd] = "${base_sbindir}/syslogd"
+ALTERNATIVE_LINK_NAME[klogd] = "${base_sbindir}/klogd"
+
 pkg_prerm_${PN} () {
 	if test "x$D" = "x"; then
 	if test "$1" = "upgrade" -o "$1" = "remove"; then
-- 
2.17.2


