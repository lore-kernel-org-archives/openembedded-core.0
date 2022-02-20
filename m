Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E55C433EF
	for <webhook@archiver.kernel.org>; Sun, 20 Feb 2022 00:08:53 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.16500.1645315732461117216
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 16:08:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QZbEf9cz;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id p9so20581943wra.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 16:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GdnE8hc6dp6Vwb/dtlNEptawNJeaVI0HqKjxWXhsxLM=;
        b=QZbEf9czmbl8rIgtkQYVpB91ko50QCnnKoUVy3MaBFRMv1Gd94VZXrqmxpbpfMLOnP
         F9LLiwaVL9Pj2ak1zL5BpXQ5KxEYXYE3A/D1ahbsb5c0QKa5HbYRvg+XwkGF0pigvXvt
         tL666QZaqEYWe8cGQ0cNRp3JksGP6iB8LXr42MxNRx0UUzKYXFGEl66KusZyjrYAG9GR
         T+RIYxRus8tlkp5EmQI07tnON16FI+Nf4NP+StSfVQY3hTgTs885r0Inj9EFLAIGAilX
         ap6+vJ3b37ZkAsQ3NZrXvgn1lI/iRTrksICrqH0bdxhmUZulKmdCoPWYiIFFe4q6KobV
         hYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GdnE8hc6dp6Vwb/dtlNEptawNJeaVI0HqKjxWXhsxLM=;
        b=q+O0wDsBnppck8d8MAsj8ylC4wO/Y/+VyFIUi0RJbYCtvr0UZWegIoaPdCN1rf6R5d
         A+ZrFam2Zz+Kt54dCr6Ys+czpZ8hWR4xAd7qb+lapH/9uo9DUkMjWOPJ1K9u4QxYNgfJ
         IF91isKKRkUr0w3yk91KxjgwwWNZF1R4sCmWBo9gQ45UIblsAoSwN9d8Jf8ihArz6N8I
         FFFp42iZ/pjpPdZuX5K9sTzagDiqCeV6vMfdd45BQFM5HKFMMVxXh1nRgOMIMCxa1jmo
         6wNJUAKo8ot79bF4AHB8UPx/r2Qf3cR/ghl6/hLm8bBVI9XsuxfT5pKHMS4wCAH6+U6V
         fwRg==
X-Gm-Message-State: AOAM532Ib0z7e6goWZnnY7Lp5Op5vvXOXLwa+0n5b8PDEG2MAanCKBZw
	xmxIMp6xd7h4ALM3guKjqwRmhwLOVVg=
X-Google-Smtp-Source: 
 ABdhPJwW8nXnOrD1DMcBHQzKMQomUzQAwMQVKJubDsNUOA0VnTPLWQJBnHzhReBHA1v2vOd7M/pYUA==
X-Received: by 2002:adf:fbc4:0:b0:1e7:2060:d65 with SMTP id
 d4-20020adffbc4000000b001e720600d65mr10180576wrs.583.1645315730520;
        Sat, 19 Feb 2022 16:08:50 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 t2sm27446026wrr.55.2022.02.19.16.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 16:08:49 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/2] meson.bbclass: add support for running the meson tests at
 build time
Date: Sun, 20 Feb 2022 00:08:04 +0000
Message-Id: <20220220000805.1567335-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Feb 2022 00:08:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161977

The generic exe_wrapper introcuced in 40349dc5 can be used to run the
meson tests when build the receipe. This patch add the meson_test task
on the meson bbclass that adds this possibility.

The exe_wrapper will run using the qemu usermode and because of that it
has some limitations, one big limitation that causes many test to fail
is that it don't support the fork system call. So don't expect the same
results when it runs natively on target.

Running the tests at build time is upstream way for testing but is not
possible in OE as we always croos-compile. This can be useful in some
integration processes and for debuging and it adds the possibility to
run the test in an interactive way using the devtool build for example.

There are two variable for that:
 MESON_QEMU_WRAPPER_TEST_ENABLED: this enables the test when it's "1"
 EXTRA_OEMESON_TEST: this is used to add extra args

Some results when using this patch in the bigest meson project
on OE-core are the folloing:

cat <<'EOF' >>conf/local.conf
MESON_QEMU_WRAPPER_TEST_ENABLED:pn-systemd-boot = "1"
EOF

bitbake -c do_meson_test -v systemd-boot

Ok:                 821
Expected Fail:      0
Fail:               95
Unexpected Pass:    0
Skipped:            33
Timeout:            0

cat <<'EOF' >>conf/local.conf
MESON_QEMU_WRAPPER_TEST_ENABLED:pn-glib-2.0 = "1"
EOF

bitbake -c do_meson_test -v glib-2.0

Ok:                 197
Expected Fail:      0
Fail:               76
Unexpected Pass:    0
Skipped:            0
Timeout:            2

cat <<'EOF' >>conf/local.conf
MESON_QEMU_WRAPPER_TEST_ENABLED:pn-gstreamer1.0 = "1"
EOF

bitbake -c do_meson_test -v gstreamer1.0

Ok:                 95
Expected Fail:      0
Fail:               10
Unexpected Pass:    0
Skipped:            1
Timeout:            0

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/meson.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 0bfe945811..bc15cb8163 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -179,3 +179,19 @@ meson_do_install() {
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install
+
+EXTRA_OEMESON_TEST ?= ""
+
+do_meson_test() {
+    bbwarn "don't expect the same results when it runs natively as it will run in qemu usermode (that has its own limitations)"
+    meson test -C ${B} ${EXTRA_OEMESON_TEST}
+}
+do_meson_test[vardeps] += "EXTRA_OEMESON_TEST"
+
+MESON_QEMU_WRAPPER_RUNTEST = ""
+MESON_QEMU_WRAPPER_RUNTEST:class-target = "${@d.getVar('MESON_QEMU_WRAPPER_TEST_ENABLED') == '1' and d.getVar('EXEWRAPPER_ENABLED') == 'True'}"
+
+python() {
+    if d.getVar('MESON_QEMU_WRAPPER_RUNTEST') == 'True':
+       bb.build.addtask('meson_test', None, 'do_compile', d)
+}
-- 
2.35.1


