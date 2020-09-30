Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.6538.1601504112799901831
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HWasVTa5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id y14so2105053pgf.12
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=VSppGuu7OVM/OVEKLJeKEiPyngLfajcSKa5zldgh0H0=;
        b=HWasVTa5x+nXvXB6qQCHpGtaLHe9+FbSJaHceNQ0w10REOr50PBobKXCcYm3XYiz2u
         e9AKWsDYBwMzQ0LE9YmY+Q/YDenw2BVAkE3EBmLRWz+jnri9wCPRTiELyrtNBQ+9qiIV
         rV3JCLJgpe/6coOY4aEkLsBuHZHu6TS2Hmir8O+HTKZB7iKk6zvzhRZwNSeKk8Ae2KOh
         SvHKC0ax8QuvXQwmQHNkB3OCSXTUBN3VJyrhie06Af/iWsPbKVJBxoTvmBzpUW2Y6Y2l
         JvaU0PoVq6VH509Nz43sI3DlzVqDiMNl7P7fXCzMOU16nBxw9rWsoEQtu3ic1UzYyBYJ
         3nUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=VSppGuu7OVM/OVEKLJeKEiPyngLfajcSKa5zldgh0H0=;
        b=eeCh/Z63cqqtOqWU9IBgB8c7gK7+9dJLBx+1s10L5ZLT5ZtR2iV8J5+NnApxG3wcmu
         S9C8vlQhdRQEinImHC0uHXW8oO5f6pPlrB30gDQIBwjYoDZoZoY8FOi1YBf7ZOsFSe85
         zWOkwYfEZtLRPH1FyURWhVdZVx9QtO/powDEsFLHwdgn4MuTRQnLnRGsuo8CgaH1TWMh
         TDlrX8bNcDLrI2V2aW3ID64nn3k1JZiSuQEo+w5l0SUUuJGcx3OpT412xCPgKrgic0HI
         3yxzsiGa1X2A+dTX/ldANDPrm3BsSYRwXXVa6OrlHAn8T0RW+Z2VX3XkkjlNIluVt4mQ
         UDsw==
X-Gm-Message-State: AOAM533lk5ywTE/Y4ufiwfpzYyVqVQ9xloO321tQ1ebBoRrQWEzXOWIv
	OodgS0a3jwRzgzLkcuTnn8wSlIsMjHKsLa8EC4I=
X-Google-Smtp-Source: ABdhPJxABdphjUuOpUVystxNy3OtezkRBDLL7OIqqaxEgz0Ut/yWT2QjTBZRQYNxfkFxrJzXmBktXw==
X-Received: by 2002:a17:902:6bc1:b029:d0:cbe1:e73d with SMTP id m1-20020a1709026bc1b02900d0cbe1e73dmr4492347plt.24.1601504111792;
        Wed, 30 Sep 2020 15:15:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.15.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:15:11 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 27/41] ssh-pregen-hostkeys: Add a recipe with pregenerated ssh host keys
Date: Wed, 30 Sep 2020 12:11:29 -1000
Message-Id: <130695364281f62b9e00d311c21f7acb5a1204a1.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Host keys are getting bigger and taking an ever increasing amount of time
to generate. Whilst we do need to test that works, we don't need to test
it in every image. Add a recipe which can be added to images with
pre-generated keys, allowing us to speed up tests on the autobuilder
where it makes sense to.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c6c7d16437cbd5ccbee1b99a2154c33fdbac9299)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc      |   1 +
 .../ssh-pregen-hostkeys/dropbear_rsa_host_key | Bin 0 -> 805 bytes
 .../openssh/ssh_host_ecdsa_key                |   9 +++++
 .../openssh/ssh_host_ecdsa_key.pub            |   1 +
 .../openssh/ssh_host_ed25519_key              |   7 ++++
 .../openssh/ssh_host_ed25519_key.pub          |   1 +
 .../openssh/ssh_host_rsa_key                  |  38 ++++++++++++++++++
 .../openssh/ssh_host_rsa_key.pub              |   1 +
 .../ssh-pregen-hostkeys_1.0.bb                |  19 +++++++++
 9 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/dropbear_rsa_host_key
 create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ecdsa_key
 create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ecdsa_key.pub
 create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ed25519_key
 create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ed25519_key.pub
 create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_rsa_key
 create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_rsa_key.pub
 create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 9b0a3997c4..ff962a3be9 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -642,6 +642,7 @@ RECIPE_MAINTAINER_pn-speex = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-speexdsp = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-sqlite3 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-squashfs-tools = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER_pn-ssh-pregen-hostkeys = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-startup-notification = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-strace = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-stress-ng = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/dropbear_rsa_host_key b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/dropbear_rsa_host_key
new file mode 100644
index 0000000000000000000000000000000000000000..30443c94388530f82308f41517839c8932026eec
GIT binary patch
literal 805
zcmV+=1KRum000Mbb7(Dcb724g00RL40RR920RW_9o<Q`&RLY?p;cQBYl_0xM7ker@
z#>e=VPY-g{TMU)xikgot*E3d4mq}vnGGMFK&?`3lQuzp%&bLmM?!~`G;T{U;4Y_oX
ztW&5pYa=!AY~l?MU+0l28E$@8(~zi5Bd|IC1+@_wEtWbRYFyfC@g&!whp05e8cXIs
zAO2$|o3V1#D_vFi`9{vpf^~zgpZ#hwyW(^VKuj<OzgVE^XFF~}ce5HLEhMA_A#DjB
zr|?tGWY(1vcP3@X_D<(~^_D`?%NDne77p}AN|!y909XYC`_sATu*WrQf(gmixEp2-
z>$8a#0)WG<q}MUu|8+c0X4jT;_QU9xX=4BY0RR*iF07uNPP`KH&1{G<hh4xnn%0dY
zP#Ae@xR_Z!^$9gP{n3QwBhy^nPrHKA9b%3xtLoGy16TJlVr!|nt%cHREwUHDBZ)#&
zIuv0};sB&0b(1XUZ=R#^gKw)AJ->viB+c<qch4BVT!3pT)F^ZFH1vHt`w`Y0@D@##
z@@ZGZ%D<}4p}ve0)Xwh;edfrl=)p&V9UGh~&x8Yu)sWosd`Y;+BqJ~l)2TH)09_+3
zZ4`?ekchIl<e1h>_qjZCYr4Lp0K;iIPX5{`t64nTmV(|FuFJ&BZ$BAyJg?pxXg<a)
zbV^FhSAdt5<k_}IRCaywz#yJWqIS6&l<@!n0D%Ccn(fVgheZMOMklNB@_0x97I^c(
z)g%(nv9r;~j;->7$f}g_o>)88b=v%Es_PL7V(*H}r1F5#*9l3)Gfn<ql<Ti$LHrEj
zS-L{YkFoPvZ(fHzZ3tgU=!A>JlT_mL2YLkdI4|&EdH&9vMig5l?U-%Rc`5EN%eoyF
zuVc{w004mi|Ec<oe#A0Q9VqAgVm(o9sLt1ZfurNgFvIvhY0&q8+JQroO#OAF8r-iY
zN-Z{|f9K{)ifw^eNk}eKb<KvqcQ0#>dX6Z%1|5s(MS`eaRn9_0H4of0ISncPXCoP&
jnu6P-g&8cZCSpI?z=;2?Sr97OqIjGUAl>AZv%QM*=5vR&

literal 0
HcmV?d00001

diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ecdsa_key b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ecdsa_key
new file mode 100644
index 0000000000..86c2104ec8
--- /dev/null
+++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ecdsa_key
@@ -0,0 +1,9 @@
+-----BEGIN OPENSSH PRIVATE KEY-----
+b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAaAAAABNlY2RzYS
+1zaGEyLW5pc3RwMjU2AAAACG5pc3RwMjU2AAAAQQRJR6iZxr/NTqQN9NOwV+WPtu42r2eF
+rJ0xsnlqw5bpmfz6aDR8RQvVHUZjRGQfR/RXPbQ5x+bjjdm176TuXNhHAAAAqAoE27MKBN
+uzAAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBElHqJnGv81OpA30
+07BX5Y+27javZ4WsnTGyeWrDlumZ/PpoNHxFC9UdRmNEZB9H9Fc9tDnH5uON2bXvpO5c2E
+cAAAAgLiHv/IWhxwosz9BiNILOOPlXaueL5hVTBKUJkpOi48sAAAANcm9vdEBxZW11bWlw
+cwECAw==
+-----END OPENSSH PRIVATE KEY-----
diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ecdsa_key.pub b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ecdsa_key.pub
new file mode 100644
index 0000000000..a358aeb88a
--- /dev/null
+++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ecdsa_key.pub
@@ -0,0 +1 @@
+ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBElHqJnGv81OpA3007BX5Y+27javZ4WsnTGyeWrDlumZ/PpoNHxFC9UdRmNEZB9H9Fc9tDnH5uON2bXvpO5c2Ec= root@qemupregen
diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ed25519_key b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ed25519_key
new file mode 100644
index 0000000000..00ed9adae2
--- /dev/null
+++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ed25519_key
@@ -0,0 +1,7 @@
+-----BEGIN OPENSSH PRIVATE KEY-----
+b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
+QyNTUxOQAAACDHSFTAbJ3OTd1r1E8G5JleCmsJEpQHmdTGtMcYqwWbbwAAAJChFtV0oRbV
+dAAAAAtzc2gtZWQyNTUxOQAAACDHSFTAbJ3OTd1r1E8G5JleCmsJEpQHmdTGtMcYqwWbbw
+AAAEA8UiUsygsTbP0HkDi5leXpQaVXihDyCHeitkBCItJGhcdIVMBsnc5N3WvUTwbkmV4K
+awkSlAeZ1Ma0xxirBZtvAAAADXJvb3RAcWVtdW1pcHM=
+-----END OPENSSH PRIVATE KEY-----
diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ed25519_key.pub b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ed25519_key.pub
new file mode 100644
index 0000000000..cc0e2f43ed
--- /dev/null
+++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_ed25519_key.pub
@@ -0,0 +1 @@
+ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMdIVMBsnc5N3WvUTwbkmV4KawkSlAeZ1Ma0xxirBZtv root@qemupregen
diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_rsa_key b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_rsa_key
new file mode 100644
index 0000000000..a8e4406ba3
--- /dev/null
+++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_rsa_key
@@ -0,0 +1,38 @@
+-----BEGIN OPENSSH PRIVATE KEY-----
+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
+-----END OPENSSH PRIVATE KEY-----
diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_rsa_key.pub b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_rsa_key.pub
new file mode 100644
index 0000000000..9eb8c3838f
--- /dev/null
+++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_rsa_key.pub
@@ -0,0 +1 @@
+ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZDp3MXXHOIJAIWr574W/rDTrTuA2XIqeSG6hGrwbv8cSpdTZ4S0KLcAxSsA/yTuz2Q/m8jkLJ9KAW4L0zENXZgvZuya9HEFIqCDops3GShNoUGrKoeim5ZBxrwpFqG/O3l2H1+yZ6pqYjCAxYpNLC0MdyxvK3zieY7ZnZms1ehuC54wiP4eIlWCZafzoVAUsSg40AD6pvhJyI+zG+ZOVpD8MwCHeWVWj8gwsP2jIDIAjaRsc2dm22Vi/lOZjsgJ3fIJbzM9evE1wQXdCzV3ryBUnEuMspOVgbMlbYn5HBj7UMlnTDiWjN5CJldNdW3NwkHS2bYNy9AzOSrIBGadxJTBw9sQKURbpjbFCct5IeN7HOUIKd2JRsFN4bmJGXg4voM3jSIj0vDZVE62PZjn2f08J9qhSzTx2yAkto2sNtEesJEtJ1kno5AWIL+cDH+3h7j7B1SA06ovImqiZ011otc+q3Ov2yytxjmPUOabAq3N9MjlUz0tFCj5EQiJQI1MU= root@qemupregen
diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
new file mode 100644
index 0000000000..ddd10e6eeb
--- /dev/null
+++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Pre generated host keys mainly for speeding up our qemu tests"
+
+SRC_URI = "file://dropbear_rsa_host_key \
+           file://openssh"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+do_install () {
+	install -d ${D}${sysconfdir}/dropbear
+	install ${WORKDIR}/dropbear_rsa_host_key -m 0600 ${D}${sysconfdir}/dropbear/
+
+	install -d ${D}${sysconfdir}/ssh
+	install ${WORKDIR}/openssh/* ${D}${sysconfdir}/ssh/
+	chmod 0600 ${D}${sysconfdir}/ssh/*
+	chmod 0644 ${D}${sysconfdir}/ssh/*.pub
+}
\ No newline at end of file
-- 
2.17.1

