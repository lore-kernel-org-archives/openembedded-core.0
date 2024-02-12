Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE6BC4829D
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 13:54:59 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.6784.1707746090806236085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 05:54:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lXjQcDRM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e0a4c6c2adso709193b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 05:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707746090; x=1708350890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+tR4AWyV1zsNHCDT/86aKdlO8GKcCOpvHJBhmslRR0=;
        b=lXjQcDRMy/dNZrZRBUo44Wx+YVD6LfjbquzoH4sCv6rkLaqRFBUVMVSY6dRcaZnnFe
         bEoOVjelzEcMAHqb6Cm93XiXfAcVDWGhFPG5TiV1/AZQgE2CR+cTq8DqJ2//UplUcIXF
         +c7PuQ6jOAO0IbbU3cvk5BGUAUb/NlCU0XjOn0mx2NQ/LeG60FNKWyWRJGPkHl/vvDs/
         h+bU0W0U/bawvCm2N4eSKROuTJEXywdgWIbmFapB8FXqUxmeHLn9q3/LrR8a/yR9TaZy
         E4pPbgXayOUY8/kO+zjGt4Sh+MmZ040eoyvyuU8xNNk4gqAwQYSO1W0DvFvwgwiVm1HL
         eQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707746090; x=1708350890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+tR4AWyV1zsNHCDT/86aKdlO8GKcCOpvHJBhmslRR0=;
        b=hPOLNGarO8gkvO0vq7Ofb7s2sv4QSQbCLY2O+weUteyjlruCzz/zxz+MuxoK5NbizZ
         HDGit+CGIKI1fQ03bx360iUmPqdzNDSFX2MJduoWeipt+pdhLH6bwcyDws166ugi8h60
         HB2H2hsGHyd0jZ2LgfhP23SVIWibB6c19GpZVPsWo/Wat4y90PUxDDQupAci8iqAvPxJ
         mwnnOcAjJS690vrfgFg2BEz/xYyaK65bBWGGgcDIS12AsuD3hMBTJQbwf3Y+uNx8X5X7
         wf7EAgXfoqS1aLdxhHFYTQt958gsQOWh9InqGo9uUk5dHQrhOTjEkLErUF3ZNqpYQNkq
         qutQ==
X-Gm-Message-State: AOJu0Yx1lBx7LhkyLW7J3EwTopzw3wVxNkRLXXeIKASdVeaRJX/VFhG1
	3SvvDeJgZvggwzgsbs9IlFa8Vzws0vs3ULMebGfv4Qnm/mlJCSzuylwksJfc120CZx4+FvGinUY
	QgN8=
X-Google-Smtp-Source: AGHT+IEOOQkmlGPNnwF3RiusCW9c3IXuyqcOcqqRcoWU/nmvRejkxs020rC/DA21Jsdzi5ZKtcZ76g==
X-Received: by 2002:a05:6a21:3115:b0:19e:b15c:c8d0 with SMTP id yz21-20020a056a21311500b0019eb15cc8d0mr6472855pzb.18.1707746089755;
        Mon, 12 Feb 2024 05:54:49 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id k69-20020a638448000000b005dc421f8889sm439889pgd.26.2024.02.12.05.54.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:54:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/8] python3-pycryptodome: Fix CVE-2023-52323
Date: Mon, 12 Feb 2024 03:54:16 -1000
Message-Id: <04c9b6b081914005209bac8eeb9f417e7b989cca.1707745886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707745886.git.steve@sakoman.com>
References: <cover.1707745886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 13:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195326

From: Narpat Mali <narpat.mali@windriver.com>

PyCryptodome and pycryptodomex before 3.19.1 allow side-channel
leakage for OAEP decryption, exploitable for a Manger attack.

References:
https://security-tracker.debian.org/tracker/CVE-2023-52323
https://github.com/Legrandin/pycryptodome/blob/master/Changelog.rst

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python3-pycryptodome/CVE-2023-52323.patch | 436 ++++++++++++++++++
 .../python/python3-pycryptodome_3.14.1.bb     |   1 +
 .../CVE-2023-52323.patch                      | 436 ++++++++++++++++++
 .../python/python3-pycryptodomex_3.14.1.bb    |   2 +
 4 files changed, 875 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome/CVE-2023-52323.patch
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodomex/CVE-2023-52323.patch

diff --git a/meta/recipes-devtools/python/python3-pycryptodome/CVE-2023-52323.patch b/meta/recipes-devtools/python/python3-pycryptodome/CVE-2023-52323.patch
new file mode 100644
index 0000000000..be3090eb8d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodome/CVE-2023-52323.patch
@@ -0,0 +1,436 @@
+From 73bbed822fadddf3c0ab4a945ee6ab16bbca6961 Mon Sep 17 00:00:00 2001
+From: Helder Eijs <helderijs@gmail.com>
+Date: Thu, 1 Feb 2024 13:43:44 +0000
+Subject: [PATCH] Use constant-time (faster) padding decoding also for OAEP
+
+CVE: CVE-2023-52323
+
+Upstream-Status: Backport [https://github.com/Legrandin/pycryptodome/commit/0deea1bfe1489e8c80d2053bbb06a1aa0b181ebd]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ lib/Crypto/Cipher/PKCS1_OAEP.py         | 38 +++++-------
+ lib/Crypto/Cipher/PKCS1_v1_5.py         | 31 +---------
+ lib/Crypto/Cipher/_pkcs1_oaep_decode.py | 41 +++++++++++++
+ src/pkcs1_decode.c                      | 79 +++++++++++++++++++++++--
+ src/test/test_pkcs1.c                   | 22 +++----
+ 5 files changed, 145 insertions(+), 66 deletions(-)
+ create mode 100644 lib/Crypto/Cipher/_pkcs1_oaep_decode.py
+
+diff --git a/lib/Crypto/Cipher/PKCS1_OAEP.py b/lib/Crypto/Cipher/PKCS1_OAEP.py
+index 57a982b..6974584 100644
+--- a/lib/Crypto/Cipher/PKCS1_OAEP.py
++++ b/lib/Crypto/Cipher/PKCS1_OAEP.py
+@@ -23,11 +23,13 @@
+ from Crypto.Signature.pss import MGF1
+ import Crypto.Hash.SHA1
+
+-from Crypto.Util.py3compat import bord, _copy_bytes
++from Crypto.Util.py3compat import _copy_bytes
+ import Crypto.Util.number
+-from   Crypto.Util.number import ceil_div, bytes_to_long, long_to_bytes
+-from   Crypto.Util.strxor import strxor
++from Crypto.Util.number import ceil_div, bytes_to_long, long_to_bytes
++from Crypto.Util.strxor import strxor
+ from Crypto import Random
++from ._pkcs1_oaep_decode import oaep_decode
++
+
+ class PKCS1OAEP_Cipher:
+     """Cipher object for PKCS#1 v1.5 OAEP.
+@@ -68,7 +70,7 @@ class PKCS1OAEP_Cipher:
+         if mgfunc:
+             self._mgf = mgfunc
+         else:
+-            self._mgf = lambda x,y: MGF1(x,y,self._hashObj)
++            self._mgf = lambda x, y: MGF1(x, y, self._hashObj)
+
+         self._label = _copy_bytes(None, None, label)
+         self._randfunc = randfunc
+@@ -105,7 +107,7 @@ class PKCS1OAEP_Cipher:
+
+         # See 7.1.1 in RFC3447
+         modBits = Crypto.Util.number.size(self._key.n)
+-        k = ceil_div(modBits, 8) # Convert from bits to bytes
++        k = ceil_div(modBits, 8)            # Convert from bits to bytes
+         hLen = self._hashObj.digest_size
+         mLen = len(message)
+
+@@ -159,11 +161,11 @@ class PKCS1OAEP_Cipher:
+
+         # See 7.1.2 in RFC3447
+         modBits = Crypto.Util.number.size(self._key.n)
+-        k = ceil_div(modBits,8) # Convert from bits to bytes
++        k = ceil_div(modBits, 8)            # Convert from bits to bytes
+         hLen = self._hashObj.digest_size
+
+         # Step 1b and 1c
+-        if len(ciphertext) != k or k<hLen+2:
++        if len(ciphertext) != k or k < hLen+2:
+             raise ValueError("Ciphertext with incorrect length.")
+         # Step 2a (O2SIP)
+         ct_int = bytes_to_long(ciphertext)
+@@ -173,8 +175,6 @@ class PKCS1OAEP_Cipher:
+         em = long_to_bytes(m_int, k)
+         # Step 3a
+         lHash = self._hashObj.new(self._label).digest()
+-        # Step 3b
+-        y = em[0]
+         # y must be 0, but we MUST NOT check it here in order not to
+         # allow attacks like Manger's (http://dl.acm.org/citation.cfm?id=704143)
+         maskedSeed = em[1:hLen+1]
+@@ -187,22 +187,17 @@ class PKCS1OAEP_Cipher:
+         dbMask = self._mgf(seed, k-hLen-1)
+         # Step 3f
+         db = strxor(maskedDB, dbMask)
+-        # Step 3g
+-        one_pos = hLen + db[hLen:].find(b'\x01')
+-        lHash1 = db[:hLen]
+-        invalid = bord(y) | int(one_pos < hLen)
+-        hash_compare = strxor(lHash1, lHash)
+-        for x in hash_compare:
+-            invalid |= bord(x)
+-        for x in db[hLen:one_pos]:
+-            invalid |= bord(x)
+-        if invalid != 0:
++        # Step 3b + 3g
++        res = oaep_decode(em, lHash, db)
++        if res <= 0:
+             raise ValueError("Incorrect decryption.")
+         # Step 4
+-        return db[one_pos + 1:]
++        return db[res:]
++
+
+ def new(key, hashAlgo=None, mgfunc=None, label=b'', randfunc=None):
+-    """Return a cipher object :class:`PKCS1OAEP_Cipher` that can be used to perform PKCS#1 OAEP encryption or decryption.
++    """Return a cipher object :class:`PKCS1OAEP_Cipher`
++       that can be used to perform PKCS#1 OAEP encryption or decryption.
+
+     :param key:
+       The key object to use to encrypt or decrypt the message.
+@@ -236,4 +231,3 @@ def new(key, hashAlgo=None, mgfunc=None, label=b'', randfunc=None):
+     if randfunc is None:
+         randfunc = Random.get_random_bytes
+     return PKCS1OAEP_Cipher(key, hashAlgo, mgfunc, label, randfunc)
+-
+diff --git a/lib/Crypto/Cipher/PKCS1_v1_5.py b/lib/Crypto/Cipher/PKCS1_v1_5.py
+index d0d474a..94e99cf 100644
+--- a/lib/Crypto/Cipher/PKCS1_v1_5.py
++++ b/lib/Crypto/Cipher/PKCS1_v1_5.py
+@@ -25,31 +25,7 @@ __all__ = ['new', 'PKCS115_Cipher']
+ from Crypto import Random
+ from Crypto.Util.number import bytes_to_long, long_to_bytes
+ from Crypto.Util.py3compat import bord, is_bytes, _copy_bytes
+-
+-from Crypto.Util._raw_api import (load_pycryptodome_raw_lib, c_size_t,
+-                                  c_uint8_ptr)
+-
+-
+-_raw_pkcs1_decode = load_pycryptodome_raw_lib("Crypto.Cipher._pkcs1_decode",
+-                        """
+-                        int pkcs1_decode(const uint8_t *em, size_t len_em,
+-                                         const uint8_t *sentinel, size_t len_sentinel,
+-                                         size_t expected_pt_len,
+-                                         uint8_t *output);
+-                        """)
+-
+-
+-def _pkcs1_decode(em, sentinel, expected_pt_len, output):
+-    if len(em) != len(output):
+-        raise ValueError("Incorrect output length")
+-
+-    ret = _raw_pkcs1_decode.pkcs1_decode(c_uint8_ptr(em),
+-                                         c_size_t(len(em)),
+-                                         c_uint8_ptr(sentinel),
+-                                         c_size_t(len(sentinel)),
+-                                         c_size_t(expected_pt_len),
+-                                         c_uint8_ptr(output))
+-    return ret
++from ._pkcs1_oaep_decode import pkcs1_decode
+
+
+ class PKCS115_Cipher:
+@@ -113,7 +89,6 @@ class PKCS115_Cipher:
+                 continue
+             ps.append(new_byte)
+         ps = b"".join(ps)
+-        assert(len(ps) == k - mLen - 3)
+         # Step 2b
+         em = b'\x00\x02' + ps + b'\x00' + _copy_bytes(None, None, message)
+         # Step 3a (OS2IP)
+@@ -185,14 +160,14 @@ class PKCS115_Cipher:
+         # Step 3 (not constant time when the sentinel is not a byte string)
+         output = bytes(bytearray(k))
+         if not is_bytes(sentinel) or len(sentinel) > k:
+-            size = _pkcs1_decode(em, b'', expected_pt_len, output)
++            size = pkcs1_decode(em, b'', expected_pt_len, output)
+             if size < 0:
+                 return sentinel
+             else:
+                 return output[size:]
+
+         # Step 3 (somewhat constant time)
+-        size = _pkcs1_decode(em, sentinel, expected_pt_len, output)
++        size = pkcs1_decode(em, sentinel, expected_pt_len, output)
+         return output[size:]
+
+
+diff --git a/lib/Crypto/Cipher/_pkcs1_oaep_decode.py b/lib/Crypto/Cipher/_pkcs1_oaep_decode.py
+new file mode 100644
+index 0000000..fc07528
+--- /dev/null
++++ b/lib/Crypto/Cipher/_pkcs1_oaep_decode.py
+@@ -0,0 +1,41 @@
++from Crypto.Util._raw_api import (load_pycryptodome_raw_lib, c_size_t,
++                                  c_uint8_ptr)
++
++
++_raw_pkcs1_decode = load_pycryptodome_raw_lib("Crypto.Cipher._pkcs1_decode",
++                        """
++                        int pkcs1_decode(const uint8_t *em, size_t len_em,
++                                         const uint8_t *sentinel, size_t len_sentinel,
++                                         size_t expected_pt_len,
++                                         uint8_t *output);
++
++                        int oaep_decode(const uint8_t *em,
++                                        size_t em_len,
++                                        const uint8_t *lHash,
++                                        size_t hLen,
++                                        const uint8_t *db,
++                                        size_t db_len);
++                        """)
++
++
++def pkcs1_decode(em, sentinel, expected_pt_len, output):
++    if len(em) != len(output):
++        raise ValueError("Incorrect output length")
++
++    ret = _raw_pkcs1_decode.pkcs1_decode(c_uint8_ptr(em),
++                                         c_size_t(len(em)),
++                                         c_uint8_ptr(sentinel),
++                                         c_size_t(len(sentinel)),
++                                         c_size_t(expected_pt_len),
++                                         c_uint8_ptr(output))
++    return ret
++
++
++def oaep_decode(em, lHash, db):
++    ret = _raw_pkcs1_decode.oaep_decode(c_uint8_ptr(em),
++                                        c_size_t(len(em)),
++                                        c_uint8_ptr(lHash),
++                                        c_size_t(len(lHash)),
++                                        c_uint8_ptr(db),
++                                        c_size_t(len(db)))
++    return ret
+diff --git a/src/pkcs1_decode.c b/src/pkcs1_decode.c
+index 207b198..74cb4a2 100644
+--- a/src/pkcs1_decode.c
++++ b/src/pkcs1_decode.c
+@@ -130,7 +130,7 @@ STATIC size_t safe_select_idx(size_t in1, size_t in2, uint8_t choice)
+  *  - in1[] is NOT equal to in2[] where neq_mask[] is 0xFF.
+  * Return non-zero otherwise.
+  */
+-STATIC uint8_t safe_cmp(const uint8_t *in1, const uint8_t *in2,
++STATIC uint8_t safe_cmp_masks(const uint8_t *in1, const uint8_t *in2,
+                  const uint8_t *eq_mask, const uint8_t *neq_mask,
+                  size_t len)
+ {
+@@ -187,7 +187,7 @@ STATIC size_t safe_search(const uint8_t *in1, uint8_t c, size_t len)
+     return result;
+ }
+
+-#define EM_PREFIX_LEN 10
++#define PKCS1_PREFIX_LEN 10
+
+ /*
+  * Decode and verify the PKCS#1 padding, then put either the plaintext
+@@ -222,13 +222,13 @@ EXPORT_SYM int pkcs1_decode(const uint8_t *em, size_t len_em_output,
+     if (NULL == em || NULL == output || NULL == sentinel) {
+         return -1;
+     }
+-    if (len_em_output < (EM_PREFIX_LEN + 2)) {
++    if (len_em_output < (PKCS1_PREFIX_LEN + 2)) {
+         return -1;
+     }
+     if (len_sentinel > len_em_output) {
+         return -1;
+     }
+-    if (expected_pt_len > 0 && expected_pt_len > (len_em_output - EM_PREFIX_LEN - 1)) {
++    if (expected_pt_len > 0 && expected_pt_len > (len_em_output - PKCS1_PREFIX_LEN - 1)) {
+         return -1;
+     }
+
+@@ -240,7 +240,7 @@ EXPORT_SYM int pkcs1_decode(const uint8_t *em, size_t len_em_output,
+     memcpy(padded_sentinel + (len_em_output - len_sentinel), sentinel, len_sentinel);
+
+     /** The first 10 bytes must follow the pattern **/
+-    match = safe_cmp(em,
++    match = safe_cmp_masks(em,
+                      (const uint8_t*)"\x00\x02" "\x00\x00\x00\x00\x00\x00\x00\x00",
+                      (const uint8_t*)"\xFF\xFF" "\x00\x00\x00\x00\x00\x00\x00\x00",
+                      (const uint8_t*)"\x00\x00" "\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF",
+@@ -283,3 +283,72 @@ end:
+     free(padded_sentinel);
+     return result;
+ }
++
++/*
++ * Decode and verify the OAEP padding in constant time.
++ *
++ * The function returns the number of bytes to ignore at the beginning
++ * of db (the rest is the plaintext), or -1 in case of problems.
++ */
++
++EXPORT_SYM int oaep_decode(const uint8_t *em,
++                           size_t em_len,
++                           const uint8_t *lHash,
++                           size_t hLen,
++                           const uint8_t *db,
++                           size_t db_len)   /* em_len - 1 - hLen */
++{
++    int result;
++    size_t one_pos, search_len, i;
++    uint8_t wrong_padding;
++    uint8_t *eq_mask = NULL;
++    uint8_t *neq_mask = NULL;
++    uint8_t *target_db = NULL;
++
++    if (NULL == em || NULL == lHash || NULL == db) {
++        return -1;
++    }
++
++    if (em_len < 2*hLen+2 || db_len != em_len-1-hLen) {
++        return -1;
++    }
++
++    /* Allocate */
++    eq_mask = (uint8_t*) calloc(1, db_len);
++    neq_mask = (uint8_t*) calloc(1, db_len);
++    target_db = (uint8_t*) calloc(1, db_len);
++    if (NULL == eq_mask || NULL == neq_mask || NULL == target_db) {
++        result = -1;
++        goto cleanup;
++    }
++
++    /* Step 3g */
++    search_len = db_len - hLen;
++
++    one_pos = safe_search(db + hLen, 0x01, search_len);
++    if (SIZE_T_MAX == one_pos) {
++        result = -1;
++        goto cleanup;
++    }
++
++    memset(eq_mask, 0xAA, db_len);
++    memcpy(target_db, lHash, hLen);
++    memset(eq_mask, 0xFF, hLen);
++
++    for (i=0; i<search_len; i++) {
++        eq_mask[hLen + i] = propagate_ones(i < one_pos);
++    }
++
++    wrong_padding = em[0];
++    wrong_padding |= safe_cmp_masks(db, target_db, eq_mask, neq_mask, db_len);
++    set_if_match(&wrong_padding, one_pos, search_len);
++
++    result = wrong_padding ? -1 : (int)(hLen + 1 + one_pos);
++
++cleanup:
++    free(eq_mask);
++    free(neq_mask);
++    free(target_db);
++
++    return result;
++}
+diff --git a/src/test/test_pkcs1.c b/src/test/test_pkcs1.c
+index 6ef63cb..69aaac5 100644
+--- a/src/test/test_pkcs1.c
++++ b/src/test/test_pkcs1.c
+@@ -5,7 +5,7 @@ void set_if_match(uint8_t *flag, size_t term1, size_t term2);
+ void set_if_no_match(uint8_t *flag, size_t term1, size_t term2);
+ void safe_select(const uint8_t *in1, const uint8_t *in2, uint8_t *out, uint8_t choice, size_t len);
+ size_t safe_select_idx(size_t in1, size_t in2, uint8_t choice);
+-uint8_t safe_cmp(const uint8_t *in1, const uint8_t *in2,
++uint8_t safe_cmp_masks(const uint8_t *in1, const uint8_t *in2,
+                  const uint8_t *eq_mask, const uint8_t *neq_mask,
+                  size_t len);
+ size_t safe_search(const uint8_t *in1, uint8_t c, size_t len);
+@@ -80,29 +80,29 @@ void test_safe_select_idx()
+     assert(safe_select_idx(0x100004, 0x223344, 1) == 0x223344);
+ }
+
+-void test_safe_cmp()
++void test_safe_cmp_masks(void)
+ {
+     uint8_t res;
+
+-    res = safe_cmp(onezero, onezero,
++    res = safe_cmp_masks(onezero, onezero,
+                    (uint8_t*)"\xFF\xFF",
+                    (uint8_t*)"\x00\x00",
+                    2);
+     assert(res == 0);
+
+-    res = safe_cmp(onezero, zerozero,
++    res = safe_cmp_masks(onezero, zerozero,
+                    (uint8_t*)"\xFF\xFF",
+                    (uint8_t*)"\x00\x00",
+                    2);
+     assert(res != 0);
+
+-    res = safe_cmp(onezero, oneone,
++    res = safe_cmp_masks(onezero, oneone,
+                    (uint8_t*)"\xFF\xFF",
+                    (uint8_t*)"\x00\x00",
+                    2);
+     assert(res != 0);
+
+-    res = safe_cmp(onezero, oneone,
++    res = safe_cmp_masks(onezero, oneone,
+                    (uint8_t*)"\xFF\x00",
+                    (uint8_t*)"\x00\x00",
+                    2);
+@@ -110,19 +110,19 @@ void test_safe_cmp()
+
+     /** -- **/
+
+-    res = safe_cmp(onezero, onezero,
++    res = safe_cmp_masks(onezero, onezero,
+                    (uint8_t*)"\x00\x00",
+                    (uint8_t*)"\xFF\xFF",
+                    2);
+     assert(res != 0);
+
+-    res = safe_cmp(oneone, zerozero,
++    res = safe_cmp_masks(oneone, zerozero,
+                    (uint8_t*)"\x00\x00",
+                    (uint8_t*)"\xFF\xFF",
+                    2);
+     assert(res == 0);
+
+-    res = safe_cmp(onezero, oneone,
++    res = safe_cmp_masks(onezero, oneone,
+                    (uint8_t*)"\x00\x00",
+                    (uint8_t*)"\x00\xFF",
+                    2);
+@@ -130,7 +130,7 @@ void test_safe_cmp()
+
+     /** -- **/
+
+-    res = safe_cmp(onezero, oneone,
++    res = safe_cmp_masks(onezero, oneone,
+                    (uint8_t*)"\xFF\x00",
+                    (uint8_t*)"\x00\xFF",
+                    2);
+@@ -158,7 +158,7 @@ int main(void)
+     test_set_if_no_match();
+     test_safe_select();
+     test_safe_select_idx();
+-    test_safe_cmp();
++    test_safe_cmp_masks();
+     test_safe_search();
+     return 0;
+ }
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.14.1.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.14.1.bb
index c0324590c2..1e6c514224 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.14.1.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.14.1.bb
@@ -3,3 +3,4 @@ inherit setuptools3
 
 SRC_URI[sha256sum] = "e04e40a7f8c1669195536a37979dd87da2c32dbdc73d6fe35f0077b0c17c803b"
 
+SRC_URI += "file://CVE-2023-52323.patch"
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex/CVE-2023-52323.patch b/meta/recipes-devtools/python/python3-pycryptodomex/CVE-2023-52323.patch
new file mode 100644
index 0000000000..56000b996e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodomex/CVE-2023-52323.patch
@@ -0,0 +1,436 @@
+From 8ed5cf533be298d40ec9f75a188738ad4c3a8417 Mon Sep 17 00:00:00 2001
+From: Narpat Mali <narpat.mali@windriver.com>
+Date: Thu, 8 Feb 2024 09:09:35 +0000
+Subject: [PATCH] Use constant-time (faster) padding decoding also for OAEP
+
+CVE: CVE-2023-52323
+
+Upstream-Status: Backport [https://github.com/Legrandin/pycryptodome/commit/0deea1bfe1489e8c80d2053bbb06a1aa0b181ebd]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ lib/Cryptodome/Cipher/PKCS1_OAEP.py         | 38 +++++-----
+ lib/Cryptodome/Cipher/PKCS1_v1_5.py         | 31 +-------
+ lib/Cryptodome/Cipher/_pkcs1_oaep_decode.py | 41 +++++++++++
+ src/pkcs1_decode.c                          | 79 +++++++++++++++++++--
+ src/test/test_pkcs1.c                       | 22 +++---
+ 5 files changed, 145 insertions(+), 66 deletions(-)
+ create mode 100644 lib/Cryptodome/Cipher/_pkcs1_oaep_decode.py
+
+diff --git a/lib/Cryptodome/Cipher/PKCS1_OAEP.py b/lib/Cryptodome/Cipher/PKCS1_OAEP.py
+index 7525c5d..653df04 100644
+--- a/lib/Cryptodome/Cipher/PKCS1_OAEP.py
++++ b/lib/Cryptodome/Cipher/PKCS1_OAEP.py
+@@ -23,11 +23,13 @@
+ from Cryptodome.Signature.pss import MGF1
+ import Cryptodome.Hash.SHA1
+
+-from Cryptodome.Util.py3compat import bord, _copy_bytes
++from Crypto.Util.py3compat import _copy_bytes
+ import Cryptodome.Util.number
+-from   Cryptodome.Util.number import ceil_div, bytes_to_long, long_to_bytes
+-from   Cryptodome.Util.strxor import strxor
++from Crypto.Util.number import ceil_div, bytes_to_long, long_to_bytes
++from Crypto.Util.strxor import strxor
+ from Cryptodome import Random
++from ._pkcs1_oaep_decode import oaep_decode
++
+
+ class PKCS1OAEP_Cipher:
+     """Cipher object for PKCS#1 v1.5 OAEP.
+@@ -68,7 +70,7 @@ class PKCS1OAEP_Cipher:
+         if mgfunc:
+             self._mgf = mgfunc
+         else:
+-            self._mgf = lambda x,y: MGF1(x,y,self._hashObj)
++            self._mgf = lambda x, y: MGF1(x, y, self._hashObj)
+
+         self._label = _copy_bytes(None, None, label)
+         self._randfunc = randfunc
+@@ -105,7 +107,7 @@ class PKCS1OAEP_Cipher:
+
+         # See 7.1.1 in RFC3447
+         modBits = Cryptodome.Util.number.size(self._key.n)
+-        k = ceil_div(modBits, 8) # Convert from bits to bytes
++        k = ceil_div(modBits, 8)            # Convert from bits to bytes
+         hLen = self._hashObj.digest_size
+         mLen = len(message)
+
+@@ -159,11 +161,11 @@ class PKCS1OAEP_Cipher:
+
+         # See 7.1.2 in RFC3447
+         modBits = Cryptodome.Util.number.size(self._key.n)
+-        k = ceil_div(modBits,8) # Convert from bits to bytes
++        k = ceil_div(modBits, 8)            # Convert from bits to bytes
+         hLen = self._hashObj.digest_size
+
+         # Step 1b and 1c
+-        if len(ciphertext) != k or k<hLen+2:
++        if len(ciphertext) != k or k < hLen+2:
+             raise ValueError("Ciphertext with incorrect length.")
+         # Step 2a (O2SIP)
+         ct_int = bytes_to_long(ciphertext)
+@@ -173,8 +175,6 @@ class PKCS1OAEP_Cipher:
+         em = long_to_bytes(m_int, k)
+         # Step 3a
+         lHash = self._hashObj.new(self._label).digest()
+-        # Step 3b
+-        y = em[0]
+         # y must be 0, but we MUST NOT check it here in order not to
+         # allow attacks like Manger's (http://dl.acm.org/citation.cfm?id=704143)
+         maskedSeed = em[1:hLen+1]
+@@ -187,22 +187,17 @@ class PKCS1OAEP_Cipher:
+         dbMask = self._mgf(seed, k-hLen-1)
+         # Step 3f
+         db = strxor(maskedDB, dbMask)
+-        # Step 3g
+-        one_pos = hLen + db[hLen:].find(b'\x01')
+-        lHash1 = db[:hLen]
+-        invalid = bord(y) | int(one_pos < hLen)
+-        hash_compare = strxor(lHash1, lHash)
+-        for x in hash_compare:
+-            invalid |= bord(x)
+-        for x in db[hLen:one_pos]:
+-            invalid |= bord(x)
+-        if invalid != 0:
++        # Step 3b + 3g
++        res = oaep_decode(em, lHash, db)
++        if res <= 0:
+             raise ValueError("Incorrect decryption.")
+         # Step 4
+-        return db[one_pos + 1:]
++        return db[res:]
++
+
+ def new(key, hashAlgo=None, mgfunc=None, label=b'', randfunc=None):
+-    """Return a cipher object :class:`PKCS1OAEP_Cipher` that can be used to perform PKCS#1 OAEP encryption or decryption.
++    """Return a cipher object :class:`PKCS1OAEP_Cipher`
++       that can be used to perform PKCS#1 OAEP encryption or decryption.
+
+     :param key:
+       The key object to use to encrypt or decrypt the message.
+@@ -236,4 +231,3 @@ def new(key, hashAlgo=None, mgfunc=None, label=b'', randfunc=None):
+     if randfunc is None:
+         randfunc = Random.get_random_bytes
+     return PKCS1OAEP_Cipher(key, hashAlgo, mgfunc, label, randfunc)
+-
+diff --git a/lib/Cryptodome/Cipher/PKCS1_v1_5.py b/lib/Cryptodome/Cipher/PKCS1_v1_5.py
+index 17ef9eb..f20a7ce 100644
+--- a/lib/Cryptodome/Cipher/PKCS1_v1_5.py
++++ b/lib/Cryptodome/Cipher/PKCS1_v1_5.py
+@@ -25,31 +25,7 @@ __all__ = ['new', 'PKCS115_Cipher']
+ from Cryptodome import Random
+ from Cryptodome.Util.number import bytes_to_long, long_to_bytes
+ from Cryptodome.Util.py3compat import bord, is_bytes, _copy_bytes
+-
+-from Cryptodome.Util._raw_api import (load_pycryptodome_raw_lib, c_size_t,
+-                                  c_uint8_ptr)
+-
+-
+-_raw_pkcs1_decode = load_pycryptodome_raw_lib("Cryptodome.Cipher._pkcs1_decode",
+-                        """
+-                        int pkcs1_decode(const uint8_t *em, size_t len_em,
+-                                         const uint8_t *sentinel, size_t len_sentinel,
+-                                         size_t expected_pt_len,
+-                                         uint8_t *output);
+-                        """)
+-
+-
+-def _pkcs1_decode(em, sentinel, expected_pt_len, output):
+-    if len(em) != len(output):
+-        raise ValueError("Incorrect output length")
+-
+-    ret = _raw_pkcs1_decode.pkcs1_decode(c_uint8_ptr(em),
+-                                         c_size_t(len(em)),
+-                                         c_uint8_ptr(sentinel),
+-                                         c_size_t(len(sentinel)),
+-                                         c_size_t(expected_pt_len),
+-                                         c_uint8_ptr(output))
+-    return ret
++from ._pkcs1_oaep_decode import pkcs1_decode
+
+
+ class PKCS115_Cipher:
+@@ -113,7 +89,6 @@ class PKCS115_Cipher:
+                 continue
+             ps.append(new_byte)
+         ps = b"".join(ps)
+-        assert(len(ps) == k - mLen - 3)
+         # Step 2b
+         em = b'\x00\x02' + ps + b'\x00' + _copy_bytes(None, None, message)
+         # Step 3a (OS2IP)
+@@ -185,14 +160,14 @@ class PKCS115_Cipher:
+         # Step 3 (not constant time when the sentinel is not a byte string)
+         output = bytes(bytearray(k))
+         if not is_bytes(sentinel) or len(sentinel) > k:
+-            size = _pkcs1_decode(em, b'', expected_pt_len, output)
++            size = pkcs1_decode(em, b'', expected_pt_len, output)
+             if size < 0:
+                 return sentinel
+             else:
+                 return output[size:]
+
+         # Step 3 (somewhat constant time)
+-        size = _pkcs1_decode(em, sentinel, expected_pt_len, output)
++        size = pkcs1_decode(em, sentinel, expected_pt_len, output)
+         return output[size:]
+
+
+diff --git a/lib/Cryptodome/Cipher/_pkcs1_oaep_decode.py b/lib/Cryptodome/Cipher/_pkcs1_oaep_decode.py
+new file mode 100644
+index 0000000..fc07528
+--- /dev/null
++++ b/lib/Cryptodome/Cipher/_pkcs1_oaep_decode.py
+@@ -0,0 +1,41 @@
++from Crypto.Util._raw_api import (load_pycryptodome_raw_lib, c_size_t,
++                                  c_uint8_ptr)
++
++
++_raw_pkcs1_decode = load_pycryptodome_raw_lib("Crypto.Cipher._pkcs1_decode",
++                        """
++                        int pkcs1_decode(const uint8_t *em, size_t len_em,
++                                         const uint8_t *sentinel, size_t len_sentinel,
++                                         size_t expected_pt_len,
++                                         uint8_t *output);
++
++                        int oaep_decode(const uint8_t *em,
++                                        size_t em_len,
++                                        const uint8_t *lHash,
++                                        size_t hLen,
++                                        const uint8_t *db,
++                                        size_t db_len);
++                        """)
++
++
++def pkcs1_decode(em, sentinel, expected_pt_len, output):
++    if len(em) != len(output):
++        raise ValueError("Incorrect output length")
++
++    ret = _raw_pkcs1_decode.pkcs1_decode(c_uint8_ptr(em),
++                                         c_size_t(len(em)),
++                                         c_uint8_ptr(sentinel),
++                                         c_size_t(len(sentinel)),
++                                         c_size_t(expected_pt_len),
++                                         c_uint8_ptr(output))
++    return ret
++
++
++def oaep_decode(em, lHash, db):
++    ret = _raw_pkcs1_decode.oaep_decode(c_uint8_ptr(em),
++                                        c_size_t(len(em)),
++                                        c_uint8_ptr(lHash),
++                                        c_size_t(len(lHash)),
++                                        c_uint8_ptr(db),
++                                        c_size_t(len(db)))
++    return ret
+diff --git a/src/pkcs1_decode.c b/src/pkcs1_decode.c
+index 207b198..74cb4a2 100644
+--- a/src/pkcs1_decode.c
++++ b/src/pkcs1_decode.c
+@@ -130,7 +130,7 @@ STATIC size_t safe_select_idx(size_t in1, size_t in2, uint8_t choice)
+  *  - in1[] is NOT equal to in2[] where neq_mask[] is 0xFF.
+  * Return non-zero otherwise.
+  */
+-STATIC uint8_t safe_cmp(const uint8_t *in1, const uint8_t *in2,
++STATIC uint8_t safe_cmp_masks(const uint8_t *in1, const uint8_t *in2,
+                  const uint8_t *eq_mask, const uint8_t *neq_mask,
+                  size_t len)
+ {
+@@ -187,7 +187,7 @@ STATIC size_t safe_search(const uint8_t *in1, uint8_t c, size_t len)
+     return result;
+ }
+
+-#define EM_PREFIX_LEN 10
++#define PKCS1_PREFIX_LEN 10
+
+ /*
+  * Decode and verify the PKCS#1 padding, then put either the plaintext
+@@ -222,13 +222,13 @@ EXPORT_SYM int pkcs1_decode(const uint8_t *em, size_t len_em_output,
+     if (NULL == em || NULL == output || NULL == sentinel) {
+         return -1;
+     }
+-    if (len_em_output < (EM_PREFIX_LEN + 2)) {
++    if (len_em_output < (PKCS1_PREFIX_LEN + 2)) {
+         return -1;
+     }
+     if (len_sentinel > len_em_output) {
+         return -1;
+     }
+-    if (expected_pt_len > 0 && expected_pt_len > (len_em_output - EM_PREFIX_LEN - 1)) {
++    if (expected_pt_len > 0 && expected_pt_len > (len_em_output - PKCS1_PREFIX_LEN - 1)) {
+         return -1;
+     }
+
+@@ -240,7 +240,7 @@ EXPORT_SYM int pkcs1_decode(const uint8_t *em, size_t len_em_output,
+     memcpy(padded_sentinel + (len_em_output - len_sentinel), sentinel, len_sentinel);
+
+     /** The first 10 bytes must follow the pattern **/
+-    match = safe_cmp(em,
++    match = safe_cmp_masks(em,
+                      (const uint8_t*)"\x00\x02" "\x00\x00\x00\x00\x00\x00\x00\x00",
+                      (const uint8_t*)"\xFF\xFF" "\x00\x00\x00\x00\x00\x00\x00\x00",
+                      (const uint8_t*)"\x00\x00" "\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF",
+@@ -283,3 +283,72 @@ end:
+     free(padded_sentinel);
+     return result;
+ }
++
++/*
++ * Decode and verify the OAEP padding in constant time.
++ *
++ * The function returns the number of bytes to ignore at the beginning
++ * of db (the rest is the plaintext), or -1 in case of problems.
++ */
++
++EXPORT_SYM int oaep_decode(const uint8_t *em,
++                           size_t em_len,
++                           const uint8_t *lHash,
++                           size_t hLen,
++                           const uint8_t *db,
++                           size_t db_len)   /* em_len - 1 - hLen */
++{
++    int result;
++    size_t one_pos, search_len, i;
++    uint8_t wrong_padding;
++    uint8_t *eq_mask = NULL;
++    uint8_t *neq_mask = NULL;
++    uint8_t *target_db = NULL;
++
++    if (NULL == em || NULL == lHash || NULL == db) {
++        return -1;
++    }
++
++    if (em_len < 2*hLen+2 || db_len != em_len-1-hLen) {
++        return -1;
++    }
++
++    /* Allocate */
++    eq_mask = (uint8_t*) calloc(1, db_len);
++    neq_mask = (uint8_t*) calloc(1, db_len);
++    target_db = (uint8_t*) calloc(1, db_len);
++    if (NULL == eq_mask || NULL == neq_mask || NULL == target_db) {
++        result = -1;
++        goto cleanup;
++    }
++
++    /* Step 3g */
++    search_len = db_len - hLen;
++
++    one_pos = safe_search(db + hLen, 0x01, search_len);
++    if (SIZE_T_MAX == one_pos) {
++        result = -1;
++        goto cleanup;
++    }
++
++    memset(eq_mask, 0xAA, db_len);
++    memcpy(target_db, lHash, hLen);
++    memset(eq_mask, 0xFF, hLen);
++
++    for (i=0; i<search_len; i++) {
++        eq_mask[hLen + i] = propagate_ones(i < one_pos);
++    }
++
++    wrong_padding = em[0];
++    wrong_padding |= safe_cmp_masks(db, target_db, eq_mask, neq_mask, db_len);
++    set_if_match(&wrong_padding, one_pos, search_len);
++
++    result = wrong_padding ? -1 : (int)(hLen + 1 + one_pos);
++
++cleanup:
++    free(eq_mask);
++    free(neq_mask);
++    free(target_db);
++
++    return result;
++}
+diff --git a/src/test/test_pkcs1.c b/src/test/test_pkcs1.c
+index 6ef63cb..69aaac5 100644
+--- a/src/test/test_pkcs1.c
++++ b/src/test/test_pkcs1.c
+@@ -5,7 +5,7 @@ void set_if_match(uint8_t *flag, size_t term1, size_t term2);
+ void set_if_no_match(uint8_t *flag, size_t term1, size_t term2);
+ void safe_select(const uint8_t *in1, const uint8_t *in2, uint8_t *out, uint8_t choice, size_t len);
+ size_t safe_select_idx(size_t in1, size_t in2, uint8_t choice);
+-uint8_t safe_cmp(const uint8_t *in1, const uint8_t *in2,
++uint8_t safe_cmp_masks(const uint8_t *in1, const uint8_t *in2,
+                  const uint8_t *eq_mask, const uint8_t *neq_mask,
+                  size_t len);
+ size_t safe_search(const uint8_t *in1, uint8_t c, size_t len);
+@@ -80,29 +80,29 @@ void test_safe_select_idx()
+     assert(safe_select_idx(0x100004, 0x223344, 1) == 0x223344);
+ }
+
+-void test_safe_cmp()
++void test_safe_cmp_masks(void)
+ {
+     uint8_t res;
+
+-    res = safe_cmp(onezero, onezero,
++    res = safe_cmp_masks(onezero, onezero,
+                    (uint8_t*)"\xFF\xFF",
+                    (uint8_t*)"\x00\x00",
+                    2);
+     assert(res == 0);
+
+-    res = safe_cmp(onezero, zerozero,
++    res = safe_cmp_masks(onezero, zerozero,
+                    (uint8_t*)"\xFF\xFF",
+                    (uint8_t*)"\x00\x00",
+                    2);
+     assert(res != 0);
+
+-    res = safe_cmp(onezero, oneone,
++    res = safe_cmp_masks(onezero, oneone,
+                    (uint8_t*)"\xFF\xFF",
+                    (uint8_t*)"\x00\x00",
+                    2);
+     assert(res != 0);
+
+-    res = safe_cmp(onezero, oneone,
++    res = safe_cmp_masks(onezero, oneone,
+                    (uint8_t*)"\xFF\x00",
+                    (uint8_t*)"\x00\x00",
+                    2);
+@@ -110,19 +110,19 @@ void test_safe_cmp()
+
+     /** -- **/
+
+-    res = safe_cmp(onezero, onezero,
++    res = safe_cmp_masks(onezero, onezero,
+                    (uint8_t*)"\x00\x00",
+                    (uint8_t*)"\xFF\xFF",
+                    2);
+     assert(res != 0);
+
+-    res = safe_cmp(oneone, zerozero,
++    res = safe_cmp_masks(oneone, zerozero,
+                    (uint8_t*)"\x00\x00",
+                    (uint8_t*)"\xFF\xFF",
+                    2);
+     assert(res == 0);
+
+-    res = safe_cmp(onezero, oneone,
++    res = safe_cmp_masks(onezero, oneone,
+                    (uint8_t*)"\x00\x00",
+                    (uint8_t*)"\x00\xFF",
+                    2);
+@@ -130,7 +130,7 @@ void test_safe_cmp()
+
+     /** -- **/
+
+-    res = safe_cmp(onezero, oneone,
++    res = safe_cmp_masks(onezero, oneone,
+                    (uint8_t*)"\xFF\x00",
+                    (uint8_t*)"\x00\xFF",
+                    2);
+@@ -158,7 +158,7 @@ int main(void)
+     test_set_if_no_match();
+     test_safe_select();
+     test_safe_select_idx();
+-    test_safe_cmp();
++    test_safe_cmp_masks();
+     test_safe_search();
+     return 0;
+ }
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.14.1.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.14.1.bb
index 79a3fee19c..31ad3fda5e 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.14.1.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.14.1.bb
@@ -3,6 +3,8 @@ inherit setuptools3
 
 SRC_URI[sha256sum] = "2ce76ed0081fd6ac8c74edc75b9d14eca2064173af79843c24fa62573263c1f2"
 
+SRC_URI += "file://CVE-2023-52323.patch"
+
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/__pycache__/ \
-- 
2.34.1


