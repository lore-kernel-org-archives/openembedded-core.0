Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75921D15D80
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 15:12:07 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17542.1764774613380839624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 07:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=DCZYi8ka;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.128.52, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779ebfa91aso7329825e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 07:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1764774612; x=1765379412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xKDbb0iy4bTfW9NG9ut4avTzl/LOCaxOl3kCouErsA=;
        b=DCZYi8kaECl5hN31+pGqY52WkMdW2CAOyPj58k8C9lBO2mVmHtCCSA20P+kwWzpEsH
         BwwLgkmyv9zv1P488DMC9rKlt5mc868fWGVf881JKtuGt2bz8RH3Rj7Rf1E4vxsCvHJ+
         M3pEbUaHx4Ju/A07I9njjr837BH5ElJ+y1U5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764774612; x=1765379412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5xKDbb0iy4bTfW9NG9ut4avTzl/LOCaxOl3kCouErsA=;
        b=aEXpVR1XKtylgbchhszwItwcV/AUoJbgO8AhhVRGfQB9LfcYHg/iPGVMHJsqz/yCPP
         ca8hi1inRHYsVxV2+X8mRypRS1bOlH2M+TqPLLRYqoA2k3Tl0KjedFANp4dFhlVYc1QB
         2bd9qse2txDz8C2FxGQ/BgTE6WIhbaQuBBdP1mZR97A6JE7ovjeF/1tRJuNU1c5NEC9L
         /cT+vmVsE46ln5nuXbYo/H1pyTpPVLZbz2YnEtLtAbYitrtta/GgCbC8zSOgoEEcscvU
         R1zvk9+uLQiow2WdwDIllyZoG2tc9x3zEGETg4ine7U9W4uCO5/0oiJq2oXW2OSphpXV
         zqKQ==
X-Gm-Message-State: AOJu0YyslpJGJFR4pT1tJWyknaO0qO3/cjfIZImEbyCTBPaIYT5AERic
	bk964sb7R3mCecqBToNggmAgX22Sg6c7Dp87xYFDK8ikGzktiJBxM2Uv7E7X2m1RhK5TS8ci8oE
	S4JGF
X-Gm-Gg: ASbGncsiwzOgN/Dckqj95LHY+HOQLrIB68EOMcgPa/nC9MFgpzFT3Oe5tAWWX955Kho
	arFzPxW+nzBPzkv37yo/HubcidDfKnQ8WEGdjlo3Myk+CL+HqFw4j2dqoU0yVvWhwIJO0DRdvfj
	xtJ59CMvmnLJtrEEt2iqaYXTRp8ncO9SVjOg3FltOpfG1rerN+eenRM2svFuOCyhVFUjFxKoLf7
	E/ChCGED5xXWDMmV7wnkDW5XqXp3x5HUHqoANaF8E8+Ex4FaDT+z37xumHUnrfpy9SpaWS8F3mE
	pOC2NEXJTaRCapKBeXV0HaGDLF7OQCPoqvzZ5F65TDpnz8pcfPEIOunzJt1c4K0MM4wnlfQ3eqx
	nmAdxdZqDptaGmkG4Ysj9zJWoXDBxMBYUfWj7oUCu7WmLsZN5fMO4MTV8+2/70vAi7ZiqCu5KSW
	v7AMeFb1f+l0S5F7+SCgfumUm/W5lOMDJGrKsIDmvJ75h29lt4171u9YXWvl01CqpNk6Zgjr9tb
	DWblkq1gMfiIb6WFADKrGW0QwdNky2Wit1wmk2PEo6f0MQD63UB
X-Google-Smtp-Source: AGHT+IFp+obu5Hcy+Lbj5jWO+K6xMFNY3zgXxFKkkuYj5szaSqhXTrg0uZFn+oSZ2YrfxozANvrCjw==
X-Received: by 2002:a05:6402:40ce:b0:647:6dbd:d282 with SMTP id 4fb4d7f45d1cf-647a000ed37mr925091a12.3.1764774175094;
        Wed, 03 Dec 2025 07:02:55 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647510360dfsm18686478a12.18.2025.12.03.07.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 07:02:54 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH] rpm selftests: use sha256 keys
Date: Wed,  3 Dec 2025 16:02:51 +0100
Message-ID: <20251203150251.3778298-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203150251.3778298-1-adam.duskett@amarulasolutions.com>
References: <20251203150251.3778298-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 15:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227231

rpm selftests: use sha256 keys
Starting with RHEL9, the SHA-1 algorithm for signatures in general
and RPM package signatures specifically has been deprecated. [1]

As such, Yocto should follow suit and replace the ancient selftest signing
keys which are currently SHA1 with sequoia-compatible sha256 RSA4096 keys.

If someone runs `sq inspect ./key.secret` the output shows:
```
Invalid: No binding signature at time 2025-12-02T14:15:19Z: Policy rejected
non-revocation signature (PositiveCertification) requiring second pre-image
resistance, because SHA1 is not considered secure
```

And while there are instructions on how to update SHA1 key files to SHA256[2],
unfortuantly, the key files are 10 years old and gnupg refuses to update them.

As such, do the following:

  - Add use_sha256=True to the detach_sign call in
     meta/lib/oe/package_manager/rpm/__init__.py.

  - Add new keys in meta-selftest/files/signing/ with RSA4096 encryption and SHA256.

The keys are generated with almost the same parameters as commit 6b9d22b:

gpg gpg --expert --full-generate-key the used input was:
  - key: (8) RSA (set your own capabilities)
  - key-size: 4096
  - key-valid: 0
  - Real Name: testuser
  - Email address: testuser@email.com
  - Comment: nocomment
  - passphrase: test123

The public key and secret were then exported in armor format:
```
gpg --armor --export "$KEYID" > key.pub
gpg --output key.secret --armor --export-secret-key "$KEYID"
```

The output of `sq inspect key.secret` now shows a valid key:
```
key.secret: Transferable Secret Key.

      Fingerprint: A4C381E481817E16C5E41B6A2B910A1E01AF84DE
  Public-key algo: RSA
  Public-key size: 4096 bits
       Secret key: Encrypted
    Creation time: 2025-12-02 09:13:05 UTC
        Key flags: certification, signing, transport encryption, data-at-rest encryption

           UserID: testuser (nocomment) <testuser@email.com
```

In addition, add a gpg.batch file in case anyone else in the future needs to
regenerate the keys.

1: https://www.redhat.com/en/blog/rhel-security-sha-1-package-signatures-distrusted-rhel-9
2: https://www.redhat.com/en/blog/updating-gpg-keys-for-fedora-and-rhel

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta-selftest/files/signing/gpg.batch       |  10 ++
 meta-selftest/files/signing/key.pub         |  53 +++++-----
 meta-selftest/files/signing/key.secret      | 110 ++++++++++----------
 meta/lib/oe/package_manager/rpm/__init__.py |   3 +-
 4 files changed, 92 insertions(+), 84 deletions(-)
 create mode 100644 meta-selftest/files/signing/gpg.batch

diff --git a/meta-selftest/files/signing/gpg.batch b/meta-selftest/files/signing/gpg.batch
new file mode 100644
index 0000000000..a6642a2055
--- /dev/null
+++ b/meta-selftest/files/signing/gpg.batch
@@ -0,0 +1,10 @@
+%echo Generating test signing GPG Keys
+Key-Type: RSA
+Key-Length: 4096
+Name-Real: testuser
+Name-Email: testuser@email.com
+Name-Comment: nocomment
+Expire-Date: 0
+passphrase: test123
+%commit
+%echo done
diff --git a/meta-selftest/files/signing/key.pub b/meta-selftest/files/signing/key.pub
index e197bb3815..5d3f8650fb 100644
--- a/meta-selftest/files/signing/key.pub
+++ b/meta-selftest/files/signing/key.pub
@@ -1,30 +1,29 @@
 -----BEGIN PGP PUBLIC KEY BLOCK-----
-Version: GnuPG v1
 
-mQENBFYeMycBCADISkEj+u+3SkGbmC4b09StA3Fk4J8bKZrTTpQqUhOH4QFIQpso
-q96Q907h/ABAgB+IV0SGIeN866E7BqToqoXZ74X6EoyXWdndaMaFZSj+oNqqg6Gi
-hVsuGNpvRyyXSCYW8w9H2lFx09UufFrUxoSeP2iVdJJaUAmb8e00PCwkYrS2BZEa
-tO2VgllbaqczldmlUGnkIZt8YUSQSI/xZBDYUvbcZYBaOnDH1SDQl26f+bgyeIyS
-TW5TZb96o4tMfiifgPoqAapAxQLahG0WtjF/n1yNV5wUNQYsEQf6/h6W2rHGsCP5
-6FVFnr/ZPVam9iHUxL4lvJSI8dEH37s9GmarABEBAAG0LXRlc3R1c2VyIChub2Nv
-bW1lbnQpIDx0ZXN0dXNlckB0ZXN0ZW1haWwuY29tPokBOAQTAQIAIgUCVh4zJwIb
-AwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQezExa11krVLM2wf/fW1C8DPx
-tZEyl6iPXFjNotslo+t2TL6jPefC22KmbokJCtCnxcopBjQRuhUSNDTkXkUdVagy
-TaaYILV8XGajTmcVGQTaKeh+j6TM6CBGApQB5KhHvZCyvNBrGcNyuiex0Sm/rIhS
-fZre6ptZM/026W2kLwwJESXzHJEqCoFmU6aSOUCVyiDgMfcNw6c4NmEoqZtLdnxU
-B7Nac98o933AIvaaQMGtKIOcyOM7P/dyv8eMc38z2ew5bEB8E9aSdg5koXb3zIt5
-IKea631k4INAsFFyLMQNSmmKV7RK0miF5b4hGyekrYZRtiic5+dq5aWnVka4hBfi
-x31euxwQE87gQLkBDQRWHjMnAQgAt7C9QCFPWzLGQuQ/YaQub+8s2lYNQnmfwDHm
-5PuON+Wj/f5GyQhHKsbdUAPZ7GsjFIQnva7xNYYF/IvpC+0saB5NLMkBzjfIsg92
-6MkadAKlOR2o9gKlF59mulsJmJqNFTXiRcVXvpUnU8WB9ECmm321XfYHhk+4EMay
-H3OUZ0k6dEmvrWBTKNTR7M0z6j/jW+8J3vP3L9k1H+OV0EZwAKXfbh1lN4H467jY
-3gA7FU1WDmA06HphoSaFUEGTuXGtrRP0eksCUj3BtVygXnyQb379dISDOWcs/9Ke
-v3KMrZWgDnA4pH1eQpjycBhwKOCHYyhSSVOwCS3DGkaaklmQZwARAQABiQEfBBgB
-AgAJBQJWHjMnAhsMAAoJEHsxMWtdZK1SoPsIAKadG/tvS5COCyF8FuriL89Ysfov
-kMRKeb9hsMDbKX2lm3UtoS5ErmpkEUO/SbazQYm6/vYc8noQquqhkIdCljIvpWDv
-17tXEFfTGA493dlTTEWFt5bvzbQN6OhBu3904lAE4JGtlOOa9OKDeguwXbneLOyl
-dnlj2f7rw05cB9t/RDu7T11dTI39BMTUUm1lpWxYJk41o59b9g+fpJZkiIAJwnN3
-MwM1u9/AWfTqjNRgMAO5dIYceceTwGogujG+xz93flt+NjQhILG0T9jd0DFBgIAX
-Zq4PzX5aFDKjGoFaOOZ6r+kppBLH/HN6okMGIcfqaPPdnJI1MXFQvFzUNpo=
-=2cSJ
+mQINBGkuraEBEAC+ptWqlsUHoF+xXFUzu4ShF30L4GvIswJMy9H/ipaJDGkpdoBn
+U5bSrSd/3sU94TpQIv27qnimWL6HWLMyFVAphZ6beHNMiHAP49FsmiQ2FF1/y5QH
+LNQaOoTbB0OdBgCZBkNv+qejvUaC1I8Lu2djjn04U0n+/QWDFpV0NkG6vL2czYHR
+WqYRnLWoCM+ue9HGcJtzt3vCyAYGxCyYkmBFg8sFTi0C14Wi75g4kirt2rA5VPmR
+b3b79hLXBNWyKWjSAkXRFuhZxxWFQcO3VWIgCRVmq/s0gMz8zOFTVaiiVn0Hw3UA
+aT98YdIYHMN9nTscN7YB58pbuYSgWw8BocIRXbQliRQ37U46tp6UeKrbQC/uVX2F
+Vx5uG+wg8MlxcQGKqZ0qUb5UukZUlS4AB1xm8jJHfcR5O8TAHPLam8Dg1nU5vf4w
+wJSGVT+mbBR3KdtAyNr7eSTJJr7BlS1WlwG18UMzP5OjD8sDAcoJWqu9wZEj59y1
+jYptunXRwWIA005SWXpC4hs2ZGSuYvacFPJszsGJ2Oo03L64DS95ThRHgFGrscT8
+v35GQtQIxZzpYkyEWcBOrYHFznGzQDM15/IGUF/vlxRIzRZxCSt8XAHU7zq96CPS
+QU3IZLapKs96O+xrBWy7qX/ZgvZ9OYZ9tM6v21u8QT8scSzMQX5ISAF5sQARAQAB
+tCl0ZXN0dXNlciAobm9jb21tZW50KSA8dGVzdHVzZXJAZW1haWwuY29tPokCUQQT
+AQoAOxYhBKTDgeSBgX4WxeQbaiuRCh4Br4TeBQJpLq2hAhsPBQsJCAcCAiICBhUK
+CQgLAgQWAgMBAh4HAheAAAoJECuRCh4Br4TecwcP+wcXK5UFDjlzQ6XsY15t4DsA
+biC5Vwc16NEvGrA/gZhBM9/GyMRzQEMzMChu2m2GAkDcj/OfMX+zZrAaydO2PPQk
+zImQ7uvw8GFgTGZ1NdXJ1iiPvh3BhihXQd8CNIE6v3aC0mf10YBHAVhXpJQvCdE0
+rqPpVMkA//f+RGsaM1XfoOzfpzT9au1KL7ydQhqtwO/TjbZ0Tdb5/Blb0Nbq+Z0H
+h2hXBnBl3WK9vREBIBP7BtnQPqRaD24MtRaIPnaALLBmrA+k8GVqu4qCKl+DdAJz
+IUgOSs+Hqf41x1CgOgjvr5wdOHZexG6NEO9b6NslQnlrBtXsFGP9+BpNnxfpXPDM
+JfkIv821AOWE0LCmWfoUb7AOYNsFKah7IUXszCsib89XK2PBnBZmKq0aBNUqfRgq
+n5U4Jg2TbNeNXOI2L8a52j8vnIS+YEHQHfkgE6NMHdREu+412hPzUDeH+6K0ImXU
+6p5qcXuJTPu0LImTuhQT3X1GuGvXCEAOIyDLY93XIxYxj9/LsoSb+X3fzp7gfdRT
+JeehX0hZuXYfNmlrOp3Iyvy4n8aLC7T+doTN1OyKVGd9IzC6A/PLEBg+f1tR28gZ
+lnkGRxmaPKYekam9NbKaD2qE3G3iMRzIiJAKF7CufujDP1BU7fyH1bWyDnHcSJ/f
+80O/svEL7f7tlg1w4jlq
+=kcHT
 -----END PGP PUBLIC KEY BLOCK-----
diff --git a/meta-selftest/files/signing/key.secret b/meta-selftest/files/signing/key.secret
index d30d7cd610..e7561265d7 100644
--- a/meta-selftest/files/signing/key.secret
+++ b/meta-selftest/files/signing/key.secret
@@ -1,59 +1,57 @@
 -----BEGIN PGP PRIVATE KEY BLOCK-----
-Version: GnuPG v1
 
-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
-=b+vR
+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
+/u2WDXDiOWo=
+=DMS6
 -----END PGP PRIVATE KEY BLOCK-----
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index a51057650a..fcd2e0ee6c 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -30,7 +30,8 @@ class RpmIndexer(Indexer):
             signer.detach_sign(os.path.join(deploy_dir, 'repodata', 'repomd.xml'),
                                self.d.getVar('PACKAGE_FEED_GPG_NAME'),
                                self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
-                               armor=is_ascii_sig)
+                               armor=is_ascii_sig,
+                               use_sha256=True)
 
 class RpmSubdirIndexer(RpmIndexer):
     def write_index(self):
-- 
2.52.0


