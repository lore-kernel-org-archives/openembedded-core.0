Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E358C982DC
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:16 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1589.1789682894470389806
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XEnpcUdH;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so585435e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682893; x=1790287693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y2yxohL04FaC66ic1nHPsxZggE9jbCHoXmyxbJ+7ZOg=;
        b=XEnpcUdHuyv/E9oSBnkVffjZUz5+M0cO3oFO0LuwweRNsZN0Fb1tqpjYaRqnJB9D+P
         Og3DU3DUk5NADnCrDJkC/yR6pDJ5znTjggZJF7xvjJcPihuBgsRbzcp7/ySJrHROzkII
         kilhmO9/vaQ2D/arDsxsnI9Cijm7JwtRgrSkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682893; x=1790287693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=y2yxohL04FaC66ic1nHPsxZggE9jbCHoXmyxbJ+7ZOg=;
        b=kh37/7LZIG7FHLEiQeuCvWb+rzzjmvfE112Z1AZftjEa+DcF2BI+CWAG9uoMisOI24
         c103WuPetfXacUKdktwISXfSEk3FYeD2LzZWyrsPFigUn+wogPrPoaqpHLzuF7quoBF6
         pvuDSKr6nxmkEK6uYmEKwt5UuXU6qzyMfM/WheqUW/DGYINyGuYkXoGOXcAoXUFMdGjA
         c0YreS5XUgJw1RcFa82wBGHqFV78fMQWjV+Kf7+z4LzDfEPObRQdpzAHwl/wZ+ur0fkv
         yJKbBZU8JMIv1qK5IuxjDkxnvH8cecMNKUM7xbLrDUwUOdLEbb0AVViGsORRPvROYoSL
         zhkA==
X-Gm-Message-State: AFuF++lDyy6/z/0adXgyGPe08A+b68XgJAa/6obS5SZ1tOmxc0Yjq3uE
	4iBDaTJnzEtw0tPhxukzghdEvQIIHL8tVCICzgeG6VB6pf7OSn5/6q0T8KkbNTmQKPZ+YCy+qT5
	WEZ/5kdw=
X-Gm-Gg: AYBFou3bGVHYwf768uEJ5Jy47xZY52p48+DbYtDHql1eocU/NKTN7K09CYewohjZAgI
	AcdiCo7ryxIIVksu5zgeDswlNFkoeBevu9LHOsmp9Eb8BZ+4m8h3QXKVVp9uYyjaJmctDCB8SIv
	4yYnqdQVpehni/s1mhctx/HgIng1dap0xjGwQaaTLyTAtAgI2XUZeaKufnPD3RvK7HN6VjSVYrW
	j2f2EB6Hh9eiL2yDxPyAU/c9gkDPFs6GHhbdtrH9JD1u6nEycWxUtvX6XGhxSdyaqwuxu7N22BH
	7kg25Kczg9mWixLsJQi6iDBpgP0M2lVFFWdUZYi1N9xik5v25v2U3AaQIPglMajbQlIqmoLXL1v
	rDgiYv8275s8mGZdyQPE7BPtLyU8O42eOSnwYnVffi2wognUGng0b/VhrkEm4m5fbS6pUyHvmYw
	n2FnNMe/Vyuwrxng2wKhW2o5LKxAdcvNSFL2DIs6AW7dcSGd9hSYPW12L4Q9jYBFBEtSFgnhm7w
	t3fSUTm+8xcGMIGdZ5ZaeoAWe4qoArf7hcx+ygtr43nXfTIPqFQOaUqDCgs4qsFbmqP3VG3yTc=
X-Received: by 2002:a05:600c:8b21:b0:49d:1df8:156d with SMTP id 5b1f17b1804b1-49fc574f001mr2975365e9.18.1789682892745;
        Thu, 17 Sep 2026 15:08:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 44/79] lttng-ust: inherit upstream-stable-release-point
Date: Fri, 18 Sep 2026 00:06:29 +0200
Message-ID: <767c3921cdd88f0709731a9c46b59ed5b8479044.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246139

From: Daniel Turull <daniel.turull@ericsson.com>

lttng-ust maintains a branch per minor series (stable-2.13 through
stable-2.16) and releases from several at once: 2.14.2 and 2.15.1 went out
the same day in May 2026, and three series together in February, 2.13.10,
2.14.1 and 2.15.0. So upgrades within a major.minor are stable point
upgrades per the OE-Core stable release policy (ref-manual, "Stable Point
Release Upgrades"). There is no written policy document, so qualification
rests on that branch structure and the release contents below.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-point-release-upgrades
  https://github.com/lttng/lttng-ust/tree/stable-2.15

Upstream keeps a ChangeLog with a per-release entry list, and every entry
for the one point release in the current series is labelled a fix. 2.15.1
(May 22 2026) covers a negative error code on incorrect message size, a
shmp() return value checked before dereference, an underflow warning in
zero_file, uninitialised LTTNG_UST_LFILE and sigevent structs, close_range
inefficiency and excessive fd-tracker memory use, and a NULL check in
ustctl. The one non-fix entry changes a likely to unlikely branch hint.

Only one point release exists in the 2.15 series so far, so this also
rests on the 2.13 series' record, which ran to ten.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone took 2.13.5 -> 2.13.6 and scarthgap
2.13.7 -> 2.13.8 -> 2.13.10. wrynose has taken none and sits at 2.14.0.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Adapted for wrynose: applied to lttng-ust_2.14.0.bb (upstream: lttng-ust_2.15.1.bb).
(cherry picked from commit a5dcaef20fc91539efa08b47607c4c91f4f49849)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: lttng-ust stable policy:
https://github.com/lttng/lttng-tools/blob/stable-2.15/README.adoc#supported-versions:
|Supported versions
|------------------
|
|The LTTng project supports the last two released stable versions
|(e.g. stable-2.13 and stable-2.12).
|
|Fixes are backported from the master branch to the last stable version
|unless those fixes would break the ABI or API. Those fixes may be backported
|to the second-last stable version, depending on complexity and ABI/API
|compatibility.
|
|Security fixes are backported from the master branch to both of the last stable
|version and the the second-last stable version.
|
|New features are integrated into the master branch and not backported to the
|last stable branch.
]
---
 meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
index 1a15c5b4201..4285a445d67 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
@@ -11,7 +11,9 @@ PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}' \
 "
 
-inherit autotools lib_package manpages python3native pkgconfig
+# lttng-ust publishes bugfix/security-only releases on its per-minor
+# stable-X.Y branches, the same upstream and release model as lttng-tools.
+inherit autotools lib_package manpages python3native pkgconfig upstream-stable-release-point
 
 include lttng-platforms.inc
 

