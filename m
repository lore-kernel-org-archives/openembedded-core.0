Return-Path: <joe@deserted.net>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id A0E3D719A9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 03:59:10 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id w185so1473729ita.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 19:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=BEJ1ZRt8XZYeHBT9zW0bME5UqVdN/NG1bsH8OVNDGp0=;
	b=KmdM0VfUg1FjznwfmvkjPsLhPp28RPZVE6IN4ZgFQ6Bf7KqFfDUTZNOoxB5jv2EIW/
	fB2X49IO31VZ2H2xcusxyfXXHv3WlFzVKX1ZYSFfSCtFSCBQ+6pOk30NVNL/pDjaJfZi
	e1yz+5EqCLVS0GMwJzFaTK2F0BYmkiNHZMaHpO0V3Ly9HwLG2cucsVzqlhg4QWdQNFY8
	wGSCVYsU2uwqNPWaWJ5x87c31rIrGuEzvjuJbXf50WEUl0mwxJjPwz14h/PbJBULWhm8
	eb0lh3vYiTlKoRoHM+Zze3nt/zVZXcR4xCZ0pmUyE3yLftHcCDDhJjdDnTZkOS9sbsyI
	j74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=BEJ1ZRt8XZYeHBT9zW0bME5UqVdN/NG1bsH8OVNDGp0=;
	b=BwtCsmbO+PVSGP9+ldOz6WqYjwR8x8kYr91gR6ec+2FUzha/Zqm0SkOL2//BHCYOkz
	NFFfr5Mu4VNUY139QQ/FbBajMgnM0ExKBguNM4poBzQsi3LX+XrV1y6VatpkYxbxFC/5
	vANncwZbQp9dPsSNclTRin+MxlHTi+PQoM+ivqFyG/Z2g9AuKL10dZ1mVQKhmZarBkLJ
	72RvpOFBb4JYietQvGt6JvWONgLKiuT7R6Tj1vh90ktAxSaCaNROQApMm3z7Wnhdokpv
	ATPD1yP9IHSg73xQRzuyn8MFuLQWRbsueN4iOfxMQqfBjs8LRY52XT091KWcl9lisEBa
	DLkA==
X-Gm-Message-State: AMke39mZhjLUBnzOFntZFIVH+CNeYxjCTXIqKJ4yRCHJiExRihDY1OK5yIWqSgbEqRbrwQ==
X-Received: by 10.107.55.135 with SMTP id e129mr1019283ioa.55.1487908751517;
	Thu, 23 Feb 2017 19:59:11 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id i89sm2673888ioo.5.2017.02.23.19.59.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 19:59:10 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2017 23:00:00 -0500
Message-Id: <1487908800-18064-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] deprecated.bbclass: Add a PNDEPRECATED variable for recipes
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
X-List-Received-Date: Fri, 24 Feb 2017 03:59:13 -0000

Based on the blacklist behaviour, recipes can be tagged as deprecated.
Such recipes will produce a warning message when included in a build but
unlike blacklisted recipes, the build will continue.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---

I threw this together a long time ago and never got around to sending it out for
consideration, but after the excitement last week and this, I got thinking about
it again and thought it might be useful.  My specific use-case for this is
recipes I see in meta-networking that I know are largely abandonware but that I
don't want to completely throw out without giving some kind of heads up.
Obviously this is purely informational, there's no mechanism set up for purging
deprecated recipes, that's intended to be a maintainer activity, but the idea
would be that the maintainer would flag a recipe as deprecated (probably when
it's become more trouble than it seems to be worth) and thereafter users would
have fair warning that this thing is on notice.  If nobody speaks up within some
amount of time the maintainer considers reasonable (I'm thinking a Yocto release
cycle) then it's fair game to remove the recipe in question.

 meta/classes/deprecated.bbclass    | 16 ++++++++++++++++
 meta/conf/distro/defaultsetup.conf |  3 ++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/deprecated.bbclass

diff --git a/meta/classes/deprecated.bbclass b/meta/classes/deprecated.bbclass
new file mode 100644
index 0000000..3dcdadb
--- /dev/null
+++ b/meta/classes/deprecated.bbclass
@@ -0,0 +1,16 @@
+# To use the deprecated recipe check, a distribution should
+# include this class in the INHERIT_DISTRO
+#
+# Features:
+#
+# * To add a package to the deprecated list, set:
+#   PNDEPRECATED[pn] = "message"
+#
+
+addtask check_deprecated before do_fetch
+python do_check_deprecated () {
+    deprecated = d.getVarFlag('PNDEPRECATED', d.getVar('PN', True), False)
+
+    if deprecated:
+        bb.warn("Recipe is deprecated: ", (deprecated))
+}
diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index ca2f917..16ece3a 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -20,5 +20,6 @@ CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'
 USER_CLASSES ?= ""
 PACKAGE_CLASSES ?= "package_ipk"
 INHERIT_BLACKLIST = "blacklist"
+INHERIT_DEPRECATED = "deprecated"
 INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool"
-INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST}"
+INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST} ${INHERIT_DEPRECATED}"
-- 
1.9.1


