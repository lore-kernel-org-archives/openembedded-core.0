Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
 by mx.groups.io with SMTP id smtpd.web10.4628.1616322381985831457
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 03:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=k7rWsbUu;
 spf=pass (domain: flex--gmouse.bounces.google.com, ip: 209.85.208.74, mailfrom: 3tb9xyaykao8xdfljvxffxcv.tfd@flex--gmouse.bounces.google.com)
Received: by mail-ed1-f74.google.com with SMTP id h5so25714098edf.17
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Mar 2021 03:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Dh266FpBpeyNkzNAUtpYepc2O8zONO7pdlKAxbgO3fk=;
        b=k7rWsbUuHfrPI9kIAYgm75IoYGb2oV77eTHmkAkz+h5b3cbaxz8zQfCBIjvDErv3wL
         uUX2EPO9gdQg1bQi7ozBJelYU3jPOo5sw50G8sY8M+efsJgpna1ttanPIG1L+AEDRUY/
         R7esbmh7vao2anc4cngWwq8Lsnaa/7t34qcPBV5CINMFoUk8qSBXlkJk+VsFb9LTrjUh
         vmSIaHCRXN9xkLRe6Xo8JjXkAH75DUauSgfi9G1+PvKBhUyxEvPeWcRKPHWkbSBBqJbG
         LxP7YyWV5YJi/xyn0SBJN9nrnKoSDs227kEdxDYtdOgILqKVm6GLkYsBIheOulihQ219
         olcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Dh266FpBpeyNkzNAUtpYepc2O8zONO7pdlKAxbgO3fk=;
        b=sTePF+lvII+Nqh1lZZjrofiODc7wpVj/awptlGfpiOKg9yIo9A/b01JoHDK8RSMos4
         2Bn0Pivb1MDAqdG39GWDyuwq8RREhcpHIhu4Eh9Bbuf+fNLtDb7RgrFoiLrVL2ZtO2hz
         cj3eEoJs6pN4MGM8Dsei+bJyluQ2HNnOIumVp0yWzQMtQD7HcDCqLDhfeop0/pIevAqA
         T858MncUyv/8SujvKZ1OVba5k/j8pe5q0mRJVLXz5EoOvTM/mFOiRQVCxG349ETX+DBY
         dr11SCbACYzuxMv2VroDY1Mt6tFb3VCONvhhKE+c9UIcopad/EHrsCZfdgVRSIkoW+yv
         3kgA==
X-Gm-Message-State: AOAM533Z9QdtrpdC1YNXn9vGIvgmITN7N5mLHMaMKmcwsQEv7dIl46uo
	4uykQJfJ6CQt+BvE25WWV6JPBUaVotgPMjBo2LOmTQYque21rMOWt4JeepPG05yDbmmI1DAo2A7
	R8MM9kjwJ8kXmUbpd+BE680Gn0ZFugAN59e0F+j4ENEH4dSvXOu9AJZG0veSNy/Gy0qc6QBDpiY
	aXNNffrLhOTw==
X-Google-Smtp-Source: ABdhPJyd9mfdWxh9DNd+0/4f6stRaq0cR4xqsGQ+K3eh8yUFolOL/BGMCAkgifMkMK95rc9ZOWE/YRag0xI=
X-Received: from gmouse.zrh.corp.google.com ([2a00:79e0:42:200:ec6d:d1dd:1196:26ea])
 (user=gmouse job=sendgmr) by 2002:a05:6402:3550:: with SMTP id
 f16mr19587210edd.134.1616322380036; Sun, 21 Mar 2021 03:26:20 -0700 (PDT)
Date: Sun, 21 Mar 2021 11:26:16 +0100
Message-Id: <20210321102616.3752416-1-gmouse@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [poky][PATCH] run-postinsts: do not remove postinsts directory.
From: "Anton Kachalov" <gmouse@google.com>
To: openembedded-core@lists.openembedded.org
Cc: "Anton D. Kachalov" <gmouse@google.com>
Content-Type: text/plain; charset="UTF-8"

From: "Anton D. Kachalov" <gmouse@google.com>

When running on the systems having read-only rootfs backed by overlayfs,
removing the whole directory lead to create a special char device file
on the upperdir to reflect directory's removal. Once it is required to
upgrade the whole read-only image that might contain new postinsts scripts,
it will be impossible to run such scripts with a "deletion mark" file
on the overlayfs -- the whole directory will be marked as deleted regardless
new files in it.

Signed-off-by: Anton D. Kachalov <gmouse@google.com>
---
 .../run-postinsts/run-postinsts/run-postinsts          | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index f84a7e18c8..95dccb9cae 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -72,12 +72,12 @@ exec_postinst_scriptlets() {
 		else
 			echo "ERROR: postinst $i failed."
 			[ "$POSTINST_LOGGING" = "1" ] && eval echo "ERROR: postinst $i failed." $append_log
-			remove_pi_dir=0
+			remove_rcsd_link=0
 		fi
 	done
 }
 
-remove_pi_dir=1
+remove_rcsd_link=1
 if $pm_installed; then
 	case $pm in
 		"ipk")
@@ -92,9 +92,7 @@ else
 	exec_postinst_scriptlets
 fi
 
-# since all postinstalls executed successfully, remove the postinstalls directory
-# and the rcS.d link
-if [ $remove_pi_dir = 1 ]; then
-	rm -rf $pi_dir
+# since all postinstalls executed successfully, remove the rcS.d link
+if [ $remove_rcsd_link = 1 ]; then
 	remove_rcsd_link
 fi
-- 
2.31.0.rc2.261.g7f71774620-goog

