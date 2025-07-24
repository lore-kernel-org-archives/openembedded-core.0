Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3632CC87FC5
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 16:14:09 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.609.1753373646722536997
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 09:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U4vReIB9;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-7071b1facd3so1171856d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 09:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753373646; x=1753978446; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EX+4Offmc7nk//JhEsD7wGZqyg9OePjNstfGkevu6sY=;
        b=U4vReIB92fN5sGrKQS9Q370XSeOjTp2c+2+sZATRGLWIsuHk//tlnhVY25gj6CbQZH
         e9xTieu9oB4kenQWvZ/tis5tDmdf3BcKATqAfgayJ37rUfpNuEfAStS68OFWEyEy2Hi7
         m37F1HL621N0wRKbePYexvs3q+RR8Z2+plttwP2bKOS3pj7IAShp+u/MizlmafCp++YI
         cujuQo11sLqFjsclMNoLHJun+zH1N74XXJQg49srswFVg39621c+Py5ymmiW1skhfETB
         3/xswqnKlJN871gbeKongkReDoC7cvhIK/BGi+j5pwlQdO39Lp/GxBZ43q1r6k8d4BVT
         RtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753373646; x=1753978446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EX+4Offmc7nk//JhEsD7wGZqyg9OePjNstfGkevu6sY=;
        b=BqhDoyJiDp6khnZLKO8WitGR8PgH2P57eTLpEE0XC2veemEY/QAoeYqhMV4WhpuH/f
         HrMfk3GRCZDPZU4mL5J4A1mDPSLD6kV8SpaQ7BZdVu+kmq4svVf/4IwoDIC3IY80V1qc
         VWKN0tMNSqPGi5m2hAgal9WdCemgf8kp/rGwAHa/zOaPPjc2eBE+6Ae8OfQxKHDlnI6a
         TZ0oG/k67m/kL6zHW/0LFdgul2Au5uAx6tt1jZfKOOBeO4fRsbNR3HCfJBDdy8YAy/0E
         JKWCtCykxUW9l7pc+hPo8zooVXKFZRJgHntAbeyKuoIyqf3Qf2I/6TTXzjc7DiiP8IiT
         ilDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI71/sPBDRgUgFxP6/d909Xn7Mu+Cob3ptbUtZZU7KpkibhBjneRp6/00HoVPsM5T5hXL38RhtgBXYcQvowGJJvg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwxW8Zg5pJXCRDRMGsaQ7FIoe+An1diYX/qhd3M1KFR1I+bkIID
	hyGiWvrOK2JyodO9WGx+TmP+ia1MPC3rgvsrHO+o0h6DIlPecyV2hSXiu9PEcPKJIxxUYP/SW6Z
	FyOJxrh+4l/8EKMJE3Lzwv1aT5T6G6bZ/GPxPSC8=
X-Gm-Gg: ASbGncujOTeNRL7Lf18kXQtYpLk44tw1VgmoITpiFDXCfNJSTHrvmdJEynQAOr4y1Ok
	g5sXx+u1EGe9u6bGrN2CbZONsJJ+cRhV3z3ZSU5S2xmTtsTUwQ644NuiIcxUXPB8hGRbhlfHsRc
	eS+r0+yH6gpyd/cSiA3BVbLyO6V+NzEeL5UuNR0tgMSzvCPzt/5OGF6fYN+LU/lKijaVmISz9Qx
	1kBJygwHxxulfgzW9A34GtjnfONOBJCyB9F7XctMuS8QQ==
X-Google-Smtp-Source: AGHT+IH79TahXB76sJyJO2Q+pGo3Xqzgzm9/WZZOsIsh0SCX7pgiIUbd50UmB5czkybxGilssgkTiN1LKLT9enFrwCA=
X-Received: by 2002:a05:6214:1d0c:b0:702:c5d4:3c32 with SMTP id
 6a1803df08f44-70713bcd7e5mr34623216d6.9.1753373644729; Thu, 24 Jul 2025
 09:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250723071654.1580472-1-divya.chellam@windriver.com> <CAOSpxdZ9HHxNKf6PFEuE14BuNsDLbKj+jA=3E17SRr2aFuE3DA@mail.gmail.com>
In-Reply-To: <CAOSpxdZ9HHxNKf6PFEuE14BuNsDLbKj+jA=3E17SRr2aFuE3DA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 24 Jul 2025 18:13:53 +0200
X-Gm-Features: Ac12FXzfVDwEmVvfjs6vPiVsdar1kQiAE4MLC4gr3ejsa81dfEgaiwnlZmBSY14
Message-ID: <CANNYZj8hLK1YDgG1SF_7ESpEd9FtsbsTScTOZWMOWhqFa+hT-A@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH 1/1] ruby: fix CVE-2025-0306
To: Steve Sakoman <steve@sakoman.com>
Cc: Divya.Chellam@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000040bb49063aaf1d69"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 16:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220841

--00000000000040bb49063aaf1d69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'd rather add a new openssl version that contains the needed fix to
meta-ltx-mixins than take this. Ruby's use in embedded is marginal.

In any case, I would ask additional questions:

- how was the patch created? Was it taken from Ubuntu? Was it modified to
fit the openssl version in kirkstone, and if so, how? How can someone
independently re-create the patch?

- does the patch add a new feature to openssl? It seems invasive enough
that it does.

Referencing Ubuntu as upstream is not correct: they're not upstream for
openssl.

"Upstream-Status: Inappropriate [can't apply the exact patch]" is also not
correct, as the patch is a backport, and it isn't clear where it needs to
be 'applied' and why.

Alex

On Wed 23. Jul 2025 at 18.38, Steve Sakoman <steve@sakoman.com> wrote:

> The shortlog makes this a bit confusing, since it references ruby for
> the CVE, but only makes changes to the openssl recipe!
>
> Adding Alex since he is listed as maintainer for openssl.
>
> Steve
>
>
> On Wed, Jul 23, 2025 at 12:17=E2=80=AFAM dchellam via lists.openembedded.=
org
> <Divya.Chellam=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > From: Divya Chellam <divya.chellam@windriver.com>
> >
> > A vulnerability was found in Ruby. The Ruby interpreter is vulnerable
> > to the Marvin Attack. This attack allows the attacker to decrypt
> > previously encrypted messages or forge signatures by exchanging a
> > large number of messages with the vulnerable service.
> >
> > The issue can be workarounded by using Ruby with OpenSSL that implement=
s
> > implicit rejection enabled in OpenSSL from 3.2.x.
> >
> > References:
> > https://nvd.nist.gov/vuln/detail/CVE-2025-0306
> > https://ubuntu.com/security/CVE-2025-0306
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D2336100
> >
> https://github.com/openssl/openssl/commit/7fc67e0a33102aa47bbaa56533eeecb=
98c0450f7
> >
> https://github.com/openssl/openssl/commit/056dade341d2589975a3aae71f81c8d=
7061583c7
> >
> https://github.com/openssl/openssl/commit/8ae4f0e68ebb7435be494b58676827a=
e91695371
> >
> https://github.com/openssl/openssl/commit/5ab3ec1bb1eaa795d775f5896818cfa=
a84d33a1a
> >
> https://github.com/openssl/openssl/commit/455db0c94c0b83083ce8b792982c03a=
a56fc866f
> >
> > Upstream-patch:
> >
> https://git.launchpad.net/ubuntu/+source/openssl/commit/?id=3D94ef7be2ab8=
e3313016ee77faf592f8af6255f8e
> >
> > Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
> > ---
> >  .../openssl/openssl/CVE-2025-0306.patch       | 1391 +++++++++++++++++
> >  .../openssl/openssl_3.0.17.bb                 |    1 +
> >  2 files changed, 1392 insertions(+)
> >  create mode 100644
> meta/recipes-connectivity/openssl/openssl/CVE-2025-0306.patch
> >
> > diff --git
> a/meta/recipes-connectivity/openssl/openssl/CVE-2025-0306.patch
> b/meta/recipes-connectivity/openssl/openssl/CVE-2025-0306.patch
> > new file mode 100644
> > index 0000000000..a5d93b7637
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2025-0306.patch
> > @@ -0,0 +1,1391 @@
> > +From 94ef7be2ab8e3313016ee77faf592f8af6255f8e Mon Sep 17 00:00:00 2001
> > +From: Marc Deslauriers <marc.deslauriers@ubuntu.com>
> > +Date: Wed, 5 Feb 2025 08:17:43 -0500
> > +Subject: [PATCH] rsa: Add option to disable implicit rejection
> > +
> > +Gbp-Pq: openssl-pkcs1-implicit-rejection.patch.
> > +
> > +Source:
> https://git.launchpad.net/ubuntu/+source/openssl/commit/?id=3D94ef7be2ab8=
e3313016ee77faf592f8af6255f8e
> > +
> > +CVE: CVE-2025-0306
> > +
> > +Upstream-Status: Inappropriate [can't apply the exact patch]
> > +
> > +Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
> > +---
> > + crypto/cms/cms_env.c                          |   7 +
> > + crypto/evp/ctrl_params_translate.c            |   6 +
> > + crypto/pkcs7/pk7_doit.c                       |   7 +
> > + crypto/rsa/rsa_ossl.c                         | 101 +++-
> > + crypto/rsa/rsa_pk1.c                          | 252 ++++++++++
> > + crypto/rsa/rsa_pmeth.c                        |  20 +-
> > + doc/man1/openssl-pkeyutl.pod.in               |  15 +
> > + doc/man1/openssl-rsautl.pod.in                |   5 +
> > + doc/man3/EVP_PKEY_CTX_ctrl.pod                |   9 +
> > + doc/man3/EVP_PKEY_decrypt.pod                 |  12 +
> > + doc/man3/RSA_padding_add_PKCS1_type_1.pod     |   7 +-
> > + doc/man3/RSA_public_encrypt.pod               |  11 +-
> > + doc/man7/provider-asym_cipher.pod             |   9 +
> > + include/crypto/rsa.h                          |   4 +
> > + include/openssl/core_names.h                  |   2 +
> > + include/openssl/rsa.h                         |   5 +
> > + .../implementations/asymciphers/rsa_enc.c     |  26 +-
> > + .../30-test_evp_data/evppkey_rsa_common.txt   | 470 +++++++++++++++++=
+
> > + 18 files changed, 960 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/crypto/cms/cms_env.c b/crypto/cms/cms_env.c
> > +index 445a16f..49b0289 100644
> > +--- a/crypto/cms/cms_env.c
> > ++++ b/crypto/cms/cms_env.c
> > +@@ -581,6 +581,13 @@ static int
> cms_RecipientInfo_ktri_decrypt(CMS_ContentInfo *cms,
> > +     if (!ossl_cms_env_asn1_ctrl(ri, 1))
> > +         goto err;
> > +
> > ++    if (EVP_PKEY_is_a(pkey, "RSA"))
> > ++        /* upper layer CMS code incorrectly assumes that a successful
> RSA
> > ++         * decryption means that the key matches ciphertext (which
> never
> > ++         * was the case, implicit rejection or not), so to make it wo=
rk
> > ++         * disable implicit rejection for RSA keys */
> > ++        EVP_PKEY_CTX_ctrl_str(ktri->pctx,
> "rsa_pkcs1_implicit_rejection", "0");
> > ++
> > +     if (EVP_PKEY_decrypt(ktri->pctx, NULL, &eklen,
> > +                          ktri->encryptedKey->data,
> > +                          ktri->encryptedKey->length) <=3D 0)
> > +diff --git a/crypto/evp/ctrl_params_translate.c
> b/crypto/evp/ctrl_params_translate.c
> > +index cbf02dc..369dc1a 100644
> > +--- a/crypto/evp/ctrl_params_translate.c
> > ++++ b/crypto/evp/ctrl_params_translate.c
> > +@@ -2269,6 +2269,12 @@ static const struct translation_st
> evp_pkey_ctx_translations[] =3D {
> > +       EVP_PKEY_CTRL_GET_RSA_OAEP_LABEL, NULL, NULL,
> > +       OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL, OSSL_PARAM_OCTET_PTR, NULL }=
,
> > +
> > ++    { SET, EVP_PKEY_RSA, 0, EVP_PKEY_OP_TYPE_CRYPT,
> > ++      EVP_PKEY_CTRL_RSA_IMPLICIT_REJECTION, NULL,
> > ++      "rsa_pkcs1_implicit_rejection",
> > ++      OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION,
> OSSL_PARAM_UNSIGNED_INTEGER,
> > ++      NULL },
> > ++
> > +     { SET, EVP_PKEY_RSA_PSS, 0, EVP_PKEY_OP_TYPE_GEN,
> > +       EVP_PKEY_CTRL_MD, "rsa_pss_keygen_md", NULL,
> > +       OSSL_ALG_PARAM_DIGEST, OSSL_PARAM_UTF8_STRING, fix_md },
> > +diff --git a/crypto/pkcs7/pk7_doit.c b/crypto/pkcs7/pk7_doit.c
> > +index e9de097..6d3124d 100644
> > +--- a/crypto/pkcs7/pk7_doit.c
> > ++++ b/crypto/pkcs7/pk7_doit.c
> > +@@ -170,6 +170,13 @@ static int pkcs7_decrypt_rinfo(unsigned char
> **pek, int *peklen,
> > +     if (EVP_PKEY_decrypt_init(pctx) <=3D 0)
> > +         goto err;
> > +
> > ++    if (EVP_PKEY_is_a(pkey, "RSA"))
> > ++        /* upper layer pkcs7 code incorrectly assumes that a
> successful RSA
> > ++         * decryption means that the key matches ciphertext (which
> never
> > ++         * was the case, implicit rejection or not), so to make it wo=
rk
> > ++         * disable implicit rejection for RSA keys */
> > ++        EVP_PKEY_CTX_ctrl_str(pctx, "rsa_pkcs1_implicit_rejection",
> "0");
> > ++
> > +     if (EVP_PKEY_decrypt(pctx, NULL, &eklen,
> > +                          ri->enc_key->data, ri->enc_key->length) <=3D=
 0)
> > +         goto err;
> > +diff --git a/crypto/rsa/rsa_ossl.c b/crypto/rsa/rsa_ossl.c
> > +index 0fc642e..e5591cb 100644
> > +--- a/crypto/rsa/rsa_ossl.c
> > ++++ b/crypto/rsa/rsa_ossl.c
> > +@@ -17,6 +17,9 @@
> > + #include "crypto/bn.h"
> > + #include "rsa_local.h"
> > + #include "internal/constant_time.h"
> > ++#include <openssl/evp.h>
> > ++#include <openssl/sha.h>
> > ++#include <openssl/hmac.h>
> > +
> > + static int rsa_ossl_public_encrypt(int flen, const unsigned char *fro=
m,
> > +                                   unsigned char *to, RSA *rsa, int
> padding);
> > +@@ -377,8 +380,13 @@ static int rsa_ossl_private_decrypt(int flen,
> const unsigned char *from,
> > +     BIGNUM *f, *ret;
> > +     int j, num =3D 0, r =3D -1;
> > +     unsigned char *buf =3D NULL;
> > ++    unsigned char d_hash[SHA256_DIGEST_LENGTH] =3D {0};
> > ++    HMAC_CTX *hmac =3D NULL;
> > ++    unsigned int md_len =3D SHA256_DIGEST_LENGTH;
> > ++    unsigned char kdk[SHA256_DIGEST_LENGTH] =3D {0};
> > +     BN_CTX *ctx =3D NULL;
> > +     int local_blinding =3D 0;
> > ++    EVP_MD *md =3D NULL;
> > +     /*
> > +      * Used only if the blinding structure is shared. A non-NULL
> unblind
> > +      * instructs rsa_blinding_convert() and rsa_blinding_invert() to
> store
> > +@@ -387,6 +395,12 @@ static int rsa_ossl_private_decrypt(int flen,
> const unsigned char *from,
> > +     BIGNUM *unblind =3D NULL;
> > +     BN_BLINDING *blinding =3D NULL;
> > +
> > ++    /*
> > ++     * we need the value of the private exponent to perform implicit
> rejection
> > ++     */
> > ++    if ((rsa->flags & RSA_FLAG_EXT_PKEY) && (padding =3D=3D
> RSA_PKCS1_PADDING))
> > ++        padding =3D RSA_PKCS1_NO_IMPLICIT_REJECT_PADDING;
> > ++
> > +     if ((ctx =3D BN_CTX_new_ex(rsa->libctx)) =3D=3D NULL)
> > +         goto err;
> > +     BN_CTX_start(ctx);
> > +@@ -408,6 +422,11 @@ static int rsa_ossl_private_decrypt(int flen,
> const unsigned char *from,
> > +         goto err;
> > +     }
> > +
> > ++    if (flen < 1) {
> > ++        ERR_raise(ERR_LIB_RSA, RSA_R_DATA_TOO_SMALL);
> > ++        goto err;
> > ++    }
> > ++
> > +     /* make data into a big number */
> > +     if (BN_bin2bn(from, (int)flen, f) =3D=3D NULL)
> > +         goto err;
> > +@@ -468,6 +487,81 @@ static int rsa_ossl_private_decrypt(int flen,
> const unsigned char *from,
> > +         BN_free(d);
> > +     }
> > +
> > ++    /*
> > ++     * derive the Key Derivation Key from private exponent and public
> > ++     * ciphertext
> > ++     */
> > ++    if (padding =3D=3D RSA_PKCS1_PADDING) {
> > ++        /*
> > ++         * because we use d as a handle to rsa->d we need to keep it
> local and
> > ++         * free before any further use of rsa->d
> > ++         */
> > ++        BIGNUM *d =3D BN_new();
> > ++        if (d =3D=3D NULL) {
> > ++            ERR_raise(ERR_LIB_RSA, ERR_R_MALLOC_FAILURE);
> > ++            goto err;
> > ++        }
> > ++        if (rsa->d =3D=3D NULL) {
> > ++            ERR_raise(ERR_LIB_RSA, RSA_R_MISSING_PRIVATE_KEY);
> > ++            BN_free(d);
> > ++            goto err;
> > ++        }
> > ++        BN_with_flags(d, rsa->d, BN_FLG_CONSTTIME);
> > ++        if (BN_bn2binpad(d, buf, num) < 0) {
> > ++            ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
> > ++            BN_free(d);
> > ++            goto err;
> > ++        }
> > ++        BN_free(d);
> > ++
> > ++        /*
> > ++         * we use hardcoded hash so that migrating between versions
> that use
> > ++         * different hash doesn't provide a Bleichenbacher oracle:
> > ++         * if the attacker can see that different versions return
> different
> > ++         * messages for the same ciphertext, they'll know that the
> message is
> > ++         * syntethically generated, which means that the padding chec=
k
> failed
> > ++         */
> > ++        md =3D EVP_MD_fetch(rsa->libctx, "sha256", NULL);
> > ++        if (md =3D=3D NULL) {
> > ++            ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
> > ++            goto err;
> > ++        }
> > ++
> > ++        if (EVP_Digest(buf, num, d_hash, NULL, md, NULL) <=3D 0) {
> > ++            ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
> > ++            goto err;
> > ++        }
> > ++
> > ++        hmac =3D HMAC_CTX_new();
> > ++        if (hmac =3D=3D NULL) {
> > ++            ERR_raise(ERR_LIB_RSA, ERR_R_MALLOC_FAILURE);
> > ++            goto err;
> > ++        }
> > ++
> > ++        if (HMAC_Init_ex(hmac, d_hash, sizeof(d_hash), md, NULL) <=3D=
 0)
> {
> > ++            ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
> > ++            goto err;
> > ++        }
> > ++
> > ++        if (flen < num) {
> > ++            memset(buf, 0, num - flen);
> > ++            if (HMAC_Update(hmac, buf, num - flen) <=3D 0) {
> > ++                ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
> > ++                goto err;
> > ++            }
> > ++        }
> > ++        if (HMAC_Update(hmac, from, flen) <=3D 0) {
> > ++            ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
> > ++            goto err;
> > ++        }
> > ++
> > ++        md_len =3D SHA256_DIGEST_LENGTH;
> > ++        if (HMAC_Final(hmac, kdk, &md_len) <=3D 0) {
> > ++            ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
> > ++            goto err;
> > ++        }
> > ++    }
> > ++
> > +     if (blinding)
> > +         if (!rsa_blinding_invert(blinding, ret, unblind, ctx))
> > +             goto err;
> > +@@ -477,9 +571,12 @@ static int rsa_ossl_private_decrypt(int flen,
> const unsigned char *from,
> > +         goto err;
> > +
> > +     switch (padding) {
> > +-    case RSA_PKCS1_PADDING:
> > ++    case RSA_PKCS1_NO_IMPLICIT_REJECT_PADDING:
> > +         r =3D RSA_padding_check_PKCS1_type_2(to, num, buf, j, num);
> > +         break;
> > ++    case RSA_PKCS1_PADDING:
> > ++        r =3D ossl_rsa_padding_check_PKCS1_type_2(rsa->libctx, to, nu=
m,
> buf, j, num, kdk);
> > ++        break;
> > +     case RSA_PKCS1_OAEP_PADDING:
> > +         r =3D RSA_padding_check_PKCS1_OAEP(to, num, buf, j, num, NULL=
,
> 0);
> > +         break;
> > +@@ -501,6 +598,8 @@ static int rsa_ossl_private_decrypt(int flen, cons=
t
> unsigned char *from,
> > + #endif
> > +
> > +  err:
> > ++    HMAC_CTX_free(hmac);
> > ++    EVP_MD_free(md);
> > +     BN_CTX_end(ctx);
> > +     BN_CTX_free(ctx);
> > +     OPENSSL_clear_free(buf, num);
> > +diff --git a/crypto/rsa/rsa_pk1.c b/crypto/rsa/rsa_pk1.c
> > +index 51507fc..5cd2b26 100644
> > +--- a/crypto/rsa/rsa_pk1.c
> > ++++ b/crypto/rsa/rsa_pk1.c
> > +@@ -21,10 +21,14 @@
> > + #include <openssl/rand.h>
> > + /* Just for the SSL_MAX_MASTER_KEY_LENGTH value */
> > + #include <openssl/prov_ssl.h>
> > ++#include <openssl/evp.h>
> > ++#include <openssl/sha.h>
> > ++#include <openssl/hmac.h>
> > + #include "internal/cryptlib.h"
> > + #include "crypto/rsa.h"
> > + #include "rsa_local.h"
> > +
> > ++
> > + int RSA_padding_add_PKCS1_type_1(unsigned char *to, int tlen,
> > +                                  const unsigned char *from, int flen)
> > + {
> > +@@ -273,6 +277,254 @@ int RSA_padding_check_PKCS1_type_2(unsigned char
> *to, int tlen,
> > +     return constant_time_select_int(good, mlen, -1);
> > + }
> > +
> > ++
> > ++static int ossl_rsa_prf(OSSL_LIB_CTX *ctx,
> > ++                        unsigned char *to, int tlen,
> > ++                        const char *label, int llen,
> > ++                        const unsigned char *kdk,
> > ++                        uint16_t bitlen)
> > ++{
> > ++    int pos;
> > ++    int ret =3D -1;
> > ++    uint16_t iter =3D 0;
> > ++    unsigned char be_iter[sizeof(iter)];
> > ++    unsigned char be_bitlen[sizeof(bitlen)];
> > ++    HMAC_CTX *hmac =3D NULL;
> > ++    EVP_MD *md =3D NULL;
> > ++    unsigned char hmac_out[SHA256_DIGEST_LENGTH];
> > ++    unsigned int md_len;
> > ++
> > ++    if (tlen * 8 !=3D bitlen) {
> > ++        ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
> > ++        return ret;
> > ++    }
> > ++
> > ++    be_bitlen[0] =3D (bitlen >> 8) & 0xff;
> > ++    be_bitlen[1] =3D bitlen & 0xff;
> > ++
> > ++    hmac =3D HMAC_CTX_new();
> > ++    if (hmac =3D=3D NULL) {
> > ++        ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
> > ++        goto err;
> > ++    }
> > ++
> > ++    /*
> > ++     * we use hardcoded hash so that migrating between versions that
> use
> > ++     * different hash doesn't provide a Bleichenbacher oracle:
> > ++     * if the attacker can see that different versions return differe=
nt
> > ++     * messages for the same ciphertext, they'll know that the messag=
e
> is
> > ++     * syntethically generated, which means that the padding check
> failed
> > ++     */
> > ++    md =3D EVP_MD_fetch(ctx, "sha256", NULL);
> > ++    if (md =3D=3D NULL) {
> > ++        ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
> > ++        goto err;
> > ++    }
> > ++
> > ++    if (HMAC_Init_ex(hmac, kdk, SHA256_DIGEST_LENGTH, md, NULL) <=3D =
0) {
> > ++        ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
> > ++        goto err;
> > ++    }
> > ++
> > ++    for (pos =3D 0; pos < tlen; pos +=3D SHA256_DIGEST_LENGTH, iter++=
) {
> > ++        if (HMAC_Init_ex(hmac, NULL, 0, NULL, NULL) <=3D 0) {
> > ++            ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
> > ++            goto err;
> > ++        }
> > ++
> > ++        be_iter[0] =3D (iter >> 8) & 0xff;
> > ++        be_iter[1] =3D iter & 0xff;
> > ++
> > ++        if (HMAC_Update(hmac, be_iter, sizeof(be_iter)) <=3D 0) {
> > ++            ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
> > ++            goto err;
> > ++        }
> > ++        if (HMAC_Update(hmac, (unsigned char *)label, llen) <=3D 0) {
> > ++            ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
> > ++            goto err;
> > ++        }
> > ++        if (HMAC_Update(hmac, be_bitlen, sizeof(be_bitlen)) <=3D 0) {
> > ++            ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
> > ++            goto err;
> > ++        }
> > ++
> > ++        /*
> > ++         * HMAC_Final requires the output buffer to fit the whole MAC
> > ++         * value, so we need to use the intermediate buffer for the
> last
> > ++         * unaligned block
> > ++         */
> > ++        md_len =3D SHA256_DIGEST_LENGTH;
> > ++        if (pos + SHA256_DIGEST_LENGTH > tlen) {
> > ++            if (HMAC_Final(hmac, hmac_out, &md_len) <=3D 0) {
> > ++                ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
> > ++                goto err;
> > ++            }
> > ++            memcpy(to + pos, hmac_out, tlen - pos);
> > ++        } else {
> > ++            if (HMAC_Final(hmac, to + pos, &md_len) <=3D 0) {
> > ++                ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
> > ++                goto err;
> > ++            }
> > ++        }
> > ++    }
> > ++
> > ++    ret =3D 0;
> > ++
> > ++err:
> > ++    HMAC_CTX_free(hmac);
> > ++    EVP_MD_free(md);
> > ++    return ret;
> > ++}
> > ++
> > ++/*
> > ++ * ossl_rsa_padding_check_PKCS1_type_2() checks and removes the PKCS#=
1
> type 2
> > ++ * padding from a decrypted RSA message. Unlike the
> > ++ * RSA_padding_check_PKCS1_type_2() it will not return an error in
> case it
> > ++ * detects a padding error, rather it will return a deterministically
> generated
> > ++ * random message. In other words it will perform an implicit rejecti=
on
> > ++ * of an invalid padding. This means that the returned value does not
> indicate
> > ++ * if the padding of the encrypted message was correct or not, making
> > ++ * side channel attacks like the ones described by Bleichenbacher
> impossible
> > ++ * without access to the full decrypted value and a brute-force searc=
h
> of
> > ++ * remaining padding bytes
> > ++ */
> > ++int ossl_rsa_padding_check_PKCS1_type_2(OSSL_LIB_CTX *ctx,
> > ++                                        unsigned char *to, int tlen,
> > ++                                        const unsigned char *from, in=
t
> flen,
> > ++                                        int num, unsigned char *kdk)
> > ++{
> > ++/*
> > ++ * We need to generate a random length for the synthethic message, to
> avoid
> > ++ * bias towards zero and avoid non-constant timeness of DIV, we prepa=
re
> > ++ * 128 values to check if they are not too large for the used key siz=
e,
> > ++ * and use 0 in case none of them are small enough, as 2^-128 is a
> good enough
> > ++ * safety margin
> > ++ */
> > ++#define MAX_LEN_GEN_TRIES 128
> > ++    unsigned char *synthetic =3D NULL;
> > ++    int synthethic_length;
> > ++    uint16_t len_candidate;
> > ++    unsigned char candidate_lengths[MAX_LEN_GEN_TRIES *
> sizeof(len_candidate)];
> > ++    uint16_t len_mask;
> > ++    uint16_t max_sep_offset;
> > ++    int synth_msg_index =3D 0;
> > ++    int ret =3D -1;
> > ++    int i, j;
> > ++    unsigned int good, found_zero_byte;
> > ++    int zero_index =3D 0, msg_index;
> > ++
> > ++    /*
> > ++     * If these checks fail then either the message in publicly
> invalid, or
> > ++     * we've been called incorrectly. We can fail immediately.
> > ++     * Since this code is called only internally by openssl, those ar=
e
> just
> > ++     * sanity checks
> > ++     */
> > ++    if (num !=3D flen || tlen <=3D 0 || flen <=3D 0) {
> > ++        ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
> > ++        return -1;
> > ++    }
> > ++
> > ++    /* Generate a random message to return in case the padding checks
> fail */
> > ++    synthetic =3D OPENSSL_malloc(flen);
> > ++    if (synthetic =3D=3D NULL) {
> > ++        ERR_raise(ERR_LIB_RSA, ERR_R_MALLOC_FAILURE);
> > ++        return -1;
> > ++    }
> > ++
> > ++    if (ossl_rsa_prf(ctx, synthetic, flen, "message", 7, kdk, flen *
> 8) < 0)
> > ++        goto err;
> > ++
> > ++    /* decide how long the random message should be */
> > ++    if (ossl_rsa_prf(ctx, candidate_lengths, sizeof(candidate_lengths=
),
> > ++                     "length", 6, kdk,
> > ++                     MAX_LEN_GEN_TRIES * sizeof(len_candidate) * 8) <
> 0)
> > ++        goto err;
> > ++
> > ++    /*
> > ++     * max message size is the size of the modulus size less 2 bytes
> for
> > ++     * version and padding type and a minimum of 8 bytes padding
> > ++     */
> > ++    len_mask =3D max_sep_offset =3D flen - 2 - 8;
> > ++    /*
> > ++     * we want a mask so lets propagate the high bit to all positions
> less
> > ++     * significant than it
> > ++     */
> > ++    len_mask |=3D len_mask >> 1;
> > ++    len_mask |=3D len_mask >> 2;
> > ++    len_mask |=3D len_mask >> 4;
> > ++    len_mask |=3D len_mask >> 8;
> > ++
> > ++    synthethic_length =3D 0;
> > ++    for (i =3D 0; i < MAX_LEN_GEN_TRIES * (int)sizeof(len_candidate);
> > ++            i +=3D sizeof(len_candidate)) {
> > ++        len_candidate =3D (candidate_lengths[i] << 8) |
> candidate_lengths[i + 1];
> > ++        len_candidate &=3D len_mask;
> > ++
> > ++        synthethic_length =3D constant_time_select_int(
> > ++            constant_time_lt(len_candidate, max_sep_offset),
> > ++            len_candidate, synthethic_length);
> > ++    }
> > ++
> > ++    synth_msg_index =3D flen - synthethic_length;
> > ++
> > ++    /* we have alternative message ready, check the real one */
> > ++    good =3D constant_time_is_zero(from[0]);
> > ++    good &=3D constant_time_eq(from[1], 2);
> > ++
> > ++    /* then look for the padding|message separator (the first zero
> byte) */
> > ++    found_zero_byte =3D 0;
> > ++    for (i =3D 2; i < flen; i++) {
> > ++        unsigned int equals0 =3D constant_time_is_zero(from[i]);
> > ++        zero_index =3D constant_time_select_int(~found_zero_byte &
> equals0,
> > ++                                              i, zero_index);
> > ++        found_zero_byte |=3D equals0;
> > ++    }
> > ++
> > ++    /*
> > ++     * padding must be at least 8 bytes long, and it starts two bytes
> into
> > ++     * |from|. If we never found a 0-byte, then |zero_index| is 0 and
> the check
> > ++     * also fails.
> > ++     */
> > ++    good &=3D constant_time_ge(zero_index, 2 + 8);
> > ++
> > ++    /*
> > ++     * Skip the zero byte. This is incorrect if we never found a
> zero-byte
> > ++     * but in this case we also do not copy the message out.
> > ++     */
> > ++    msg_index =3D zero_index + 1;
> > ++
> > ++    /*
> > ++     * old code returned an error in case the decrypted message
> wouldn't fit
> > ++     * into the |to|, since that would leak information, return the
> synthethic
> > ++     * message instead
> > ++     */
> > ++    good &=3D constant_time_ge(tlen, num - msg_index);
> > ++
> > ++    msg_index =3D constant_time_select_int(good, msg_index,
> synth_msg_index);
> > ++
> > ++    /*
> > ++     * since at this point the |msg_index| does not provide the signa=
l
> > ++     * indicating if the padding check failed or not, we don't have t=
o
> worry
> > ++     * about leaking the length of returned message, we still need to
> ensure
> > ++     * that we read contents of both buffers so that cache accesses
> don't leak
> > ++     * the value of |good|
> > ++     */
> > ++    for (i =3D msg_index, j =3D 0; i < flen && j < tlen; i++, j++)
> > ++        to[j] =3D constant_time_select_8(good, from[i], synthetic[i])=
;
> > ++    ret =3D j;
> > ++
> > ++err:
> > ++    /*
> > ++     * the only time ret < 0 is when the ciphertext is publicly inval=
id
> > ++     * or we were called with invalid parameters, so we don't have to
> perform
> > ++     * a side-channel secure raising of the error
> > ++     */
> > ++    if (ret < 0)
> > ++        ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
> > ++    OPENSSL_free(synthetic);
> > ++    return ret;
> > ++}
> > ++
> > + /*
> > +  * ossl_rsa_padding_check_PKCS1_type_2_TLS() checks and removes the
> PKCS1 type 2
> > +  * padding from a decrypted RSA message in a TLS signature. The resul=
t
> is stored
> > +diff --git a/crypto/rsa/rsa_pmeth.c b/crypto/rsa/rsa_pmeth.c
> > +index 0bf5ac0..81b031f 100644
> > +--- a/crypto/rsa/rsa_pmeth.c
> > ++++ b/crypto/rsa/rsa_pmeth.c
> > +@@ -52,6 +52,8 @@ typedef struct {
> > +     /* OAEP label */
> > +     unsigned char *oaep_label;
> > +     size_t oaep_labellen;
> > ++    /* if to use implicit rejection in PKCS#1 v1.5 decryption */
> > ++    int implicit_rejection;
> > + } RSA_PKEY_CTX;
> > +
> > + /* True if PSS parameters are restricted */
> > +@@ -72,6 +74,7 @@ static int pkey_rsa_init(EVP_PKEY_CTX *ctx)
> > +     /* Maximum for sign, auto for verify */
> > +     rctx->saltlen =3D RSA_PSS_SALTLEN_AUTO;
> > +     rctx->min_saltlen =3D -1;
> > ++    rctx->implicit_rejection =3D 1;
> > +     ctx->data =3D rctx;
> > +     ctx->keygen_info =3D rctx->gentmp;
> > +     ctx->keygen_info_count =3D 2;
> > +@@ -97,6 +100,7 @@ static int pkey_rsa_copy(EVP_PKEY_CTX *dst, const
> EVP_PKEY_CTX *src)
> > +     dctx->md =3D sctx->md;
> > +     dctx->mgf1md =3D sctx->mgf1md;
> > +     dctx->saltlen =3D sctx->saltlen;
> > ++    dctx->implicit_rejection =3D sctx->implicit_rejection;
> > +     if (sctx->oaep_label) {
> > +         OPENSSL_free(dctx->oaep_label);
> > +         dctx->oaep_label =3D OPENSSL_memdup(sctx->oaep_label,
> sctx->oaep_labellen);
> > +@@ -347,6 +351,7 @@ static int pkey_rsa_decrypt(EVP_PKEY_CTX *ctx,
> > +                             const unsigned char *in, size_t inlen)
> > + {
> > +     int ret;
> > ++    int pad_mode;
> > +     RSA_PKEY_CTX *rctx =3D ctx->data;
> > +     /*
> > +      * Discard const. Its marked as const because this may be a cache=
d
> copy of
> > +@@ -367,7 +372,12 @@ static int pkey_rsa_decrypt(EVP_PKEY_CTX *ctx,
> > +                                                 rctx->oaep_labellen,
> > +                                                 rctx->md,
> rctx->mgf1md);
> > +     } else {
> > +-        ret =3D RSA_private_decrypt(inlen, in, out, rsa, rctx->pad_mo=
de);
> > ++        if (rctx->pad_mode =3D=3D RSA_PKCS1_PADDING &&
> > ++              rctx->implicit_rejection =3D=3D 0)
> > ++            pad_mode =3D RSA_PKCS1_NO_IMPLICIT_REJECT_PADDING;
> > ++        else
> > ++            pad_mode =3D rctx->pad_mode;
> > ++        ret =3D RSA_private_decrypt(inlen, in, out, rsa, pad_mode);
> > +     }
> > +     *outlen =3D constant_time_select_s(constant_time_msb_s(ret),
> *outlen, ret);
> > +     ret =3D constant_time_select_int(constant_time_msb(ret), ret, 1);
> > +@@ -591,6 +601,14 @@ static int pkey_rsa_ctrl(EVP_PKEY_CTX *ctx, int
> type, int p1, void *p2)
> > +         *(unsigned char **)p2 =3D rctx->oaep_label;
> > +         return rctx->oaep_labellen;
> > +
> > ++    case EVP_PKEY_CTRL_RSA_IMPLICIT_REJECTION:
> > ++        if (rctx->pad_mode !=3D RSA_PKCS1_PADDING) {
> > ++            ERR_raise(ERR_LIB_RSA, RSA_R_INVALID_PADDING_MODE);
> > ++            return -2;
> > ++        }
> > ++        rctx->implicit_rejection =3D p1;
> > ++        return 1;
> > ++
> > +     case EVP_PKEY_CTRL_DIGESTINIT:
> > +     case EVP_PKEY_CTRL_PKCS7_SIGN:
> > + #ifndef OPENSSL_NO_CMS
> > +diff --git a/doc/man1/openssl-pkeyutl.pod.in b/doc/man1/
> openssl-pkeyutl.pod.in
> > +index 2f6ef00..5e62551 100644
> > +--- a/doc/man1/openssl-pkeyutl.pod.in
> > ++++ b/doc/man1/openssl-pkeyutl.pod.in
> > +@@ -273,6 +273,11 @@ signed or verified directly instead of using a
> B<DigestInfo> structure. If a
> > + digest is set, then the B<DigestInfo> structure is used and its lengt=
h
> > + must correspond to the digest type.
> > +
> > ++Note, for B<pkcs1> padding, as a protection against Bleichenbacher
> attack,
> > ++the decryption will not fail in case of padding check failures. Use
> B<none>
> > ++and manual inspection of the decrypted message to verify if the
> decrypted
> > ++value has correct PKCS#1 v1.5 padding.
> > ++
> > + For B<oaep> mode only encryption and decryption is supported.
> > +
> > + For B<x931> if the digest type is set it is used to format the block
> data
> > +@@ -300,6 +305,16 @@ explicitly set in PSS mode then the signing diges=
t
> is used.
> > + Sets the digest used for the OAEP hash function. If not explicitly se=
t
> then
> > + SHA1 is used.
> > +
> > ++=3Ditem B<rsa_pkcs1_implicit_rejection:>I<flag>
> > ++
> > ++Disables (when set to 0) or enables (when set to 1) the use of implic=
it
> > ++rejection with PKCS#1 v1.5 decryption. When enabled (the default), as=
 a
> > ++protection against Bleichenbacher attack, the library will generate a
> > ++deterministic random plaintext that it will return to the caller in
> case
> > ++of padding check failure.
> > ++When disabled, it's the callers' responsibility to handle the returne=
d
> > ++errors in a side-channel free manner.
> > ++
> > + =3Dback
> > +
> > + =3Dhead1 RSA-PSS ALGORITHM
> > +diff --git a/doc/man1/openssl-rsautl.pod.in b/doc/man1/
> openssl-rsautl.pod.in
> > +index 0a32fd9..4c462ab 100644
> > +--- a/doc/man1/openssl-rsautl.pod.in
> > ++++ b/doc/man1/openssl-rsautl.pod.in
> > +@@ -105,6 +105,11 @@ The padding to use: PKCS#1 v1.5 (the default),
> PKCS#1 OAEP,
> > + ANSI X9.31, or no padding, respectively.
> > + For signatures, only B<-pkcs> and B<-raw> can be used.
> > +
> > ++Note: because of protection against Bleichenbacher attacks, decryptio=
n
> > ++using PKCS#1 v1.5 mode will not return errors in case padding check
> failed.
> > ++Use B<-raw> and inspect the returned value manually to check if the
> > ++padding is correct.
> > ++
> > + =3Ditem B<-hexdump>
> > +
> > + Hex dump the output data.
> > +diff --git a/doc/man3/EVP_PKEY_CTX_ctrl.pod
> b/doc/man3/EVP_PKEY_CTX_ctrl.pod
> > +index 3075eaa..3844aa2 100644
> > +--- a/doc/man3/EVP_PKEY_CTX_ctrl.pod
> > ++++ b/doc/man3/EVP_PKEY_CTX_ctrl.pod
> > +@@ -386,6 +386,15 @@ this behaviour should be tolerated then
> > + OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSION should be set to the
> actual
> > + negotiated protocol version. Otherwise it should be left unset.
> > +
> > ++Similarly to the B<RSA_PKCS1_WITH_TLS_PADDING> above, since OpenSSL
> version
> > ++3.1.0, the use of B<RSA_PKCS1_PADDING> will return a randomly
> generated message
> > ++instead of padding errors in case padding checks fail. Applications
> that
> > ++want to remain secure while using earlier versions of OpenSSL, still
> need to
> > ++handle both the error code from the RSA decryption operation and the
> > ++returned message in a side channel secure manner.
> > ++This protection against Bleichenbacher attacks can be disabled by
> setting
> > ++the OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION (an unsigned integer) t=
o
> 0.
> > ++
> > + =3Dhead2 DSA parameters
> > +
> > + EVP_PKEY_CTX_set_dsa_paramgen_bits() sets the number of bits used for
> DSA
> > +diff --git a/doc/man3/EVP_PKEY_decrypt.pod
> b/doc/man3/EVP_PKEY_decrypt.pod
> > +index b6f9bad..898535a 100644
> > +--- a/doc/man3/EVP_PKEY_decrypt.pod
> > ++++ b/doc/man3/EVP_PKEY_decrypt.pod
> > +@@ -51,6 +51,18 @@ return 1 for success and 0 or a negative value for
> failure. In particular a
> > + return value of -2 indicates the operation is not supported by the
> public key
> > + algorithm.
> > +
> > ++=3Dhead1 WARNINGS
> > ++
> > ++In OpenSSL versions before 3.1.0, when used in PKCS#1 v1.5 padding,
> > ++both the return value from the EVP_PKEY_decrypt() and the B<outlen>
> provided
> > ++information useful in mounting a Bleichenbacher attack against the
> > ++used private key. They had to processed in a side-channel free way.
> > ++
> > ++Since version 3.1.0, the EVP_PKEY_decrypt() method when used with
> PKCS#1
> > ++v1.5 padding doesn't return an error in case it detects an error in
> padding,
> > ++instead it returns a pseudo-randomly generated message, removing the
> need
> > ++of side-channel secure code from applications using OpenSSL.
> > ++
> > + =3Dhead1 EXAMPLES
> > +
> > + Decrypt data using OAEP (for RSA keys):
> > +diff --git a/doc/man3/RSA_padding_add_PKCS1_type_1.pod
> b/doc/man3/RSA_padding_add_PKCS1_type_1.pod
> > +index 9f7025c..36ae185 100644
> > +--- a/doc/man3/RSA_padding_add_PKCS1_type_1.pod
> > ++++ b/doc/man3/RSA_padding_add_PKCS1_type_1.pod
> > +@@ -121,8 +121,8 @@ L<ERR_get_error(3)>.
> > +
> > + =3Dhead1 WARNINGS
> > +
> > +-The result of RSA_padding_check_PKCS1_type_2() is a very sensitive
> > +-information which can potentially be used to mount a Bleichenbacher
> > ++The result of RSA_padding_check_PKCS1_type_2() is exactly the
> > ++information which is used to mount a classical Bleichenbacher
> > + padding oracle attack. This is an inherent weakness in the PKCS #1
> > + v1.5 padding design. Prefer PKCS1_OAEP padding. If that is not
> > + possible, the result of RSA_padding_check_PKCS1_type_2() should be
> > +@@ -137,6 +137,9 @@ as this would create a small timing side channel
> which could be
> > + used to mount a Bleichenbacher attack against any padding mode
> > + including PKCS1_OAEP.
> > +
> > ++You should prefer the use of EVP PKEY APIs for PKCS#1 v1.5 decryption
> > ++as they implement the necessary workarounds internally.
> > ++
> > + =3Dhead1 SEE ALSO
> > +
> > + L<RSA_public_encrypt(3)>,
> > +diff --git a/doc/man3/RSA_public_encrypt.pod
> b/doc/man3/RSA_public_encrypt.pod
> > +index 1d38073..bd3f835 100644
> > +--- a/doc/man3/RSA_public_encrypt.pod
> > ++++ b/doc/man3/RSA_public_encrypt.pod
> > +@@ -52,8 +52,8 @@ Encrypting user data directly with RSA is insecure.
> > +
> > + =3Dback
> > +
> > +-B<flen> must not be more than RSA_size(B<rsa>) - 11 for the PKCS #1
> v1.5
> > +-based padding modes, not more than RSA_size(B<rsa>) - 42 for
> > ++When encrypting B<flen> must not be more than RSA_size(B<rsa>) - 11
> for the
> > ++PKCS #1 v1.5 based padding modes, not more than RSA_size(B<rsa>) - 42
> for
> > + RSA_PKCS1_OAEP_PADDING and exactly RSA_size(B<rsa>) for RSA_NO_PADDIN=
G.
> > + When a padding mode other than RSA_NO_PADDING is in use, then
> > + RSA_public_encrypt() will include some random bytes into the cipherte=
xt
> > +@@ -92,6 +92,13 @@ which can potentially be used to mount a
> Bleichenbacher padding oracle
> > + attack. This is an inherent weakness in the PKCS #1 v1.5 padding
> > + design. Prefer RSA_PKCS1_OAEP_PADDING.
> > +
> > ++In OpenSSL before version 3.1.0, both the return value and the length
> of
> > ++returned value could be used to mount the Bleichenbacher attack.
> > ++Since version 3.1.0, OpenSSL does not return an error in case of
> padding
> > ++checks failed. Instead it generates a random message based on used
> private
> > ++key and provided ciphertext so that application code doesn't have to
> implement
> > ++a side-channel secure error handling.
> > ++
> > + =3Dhead1 CONFORMING TO
> > +
> > + SSL, PKCS #1 v2.0
> > +diff --git a/doc/man7/provider-asym_cipher.pod
> b/doc/man7/provider-asym_cipher.pod
> > +index 0976a26..2a8426a 100644
> > +--- a/doc/man7/provider-asym_cipher.pod
> > ++++ b/doc/man7/provider-asym_cipher.pod
> > +@@ -234,6 +234,15 @@ The TLS protocol version first requested by the
> client.
> > +
> > + The negotiated TLS protocol version.
> > +
> > ++=3Ditem "implicit-rejection" (B<OSSL_PKEY_PARAM_IMPLICIT_REJECTION>)
> <unsigned integer>
> > ++
> > ++Gets of sets the use of the implicit rejection mechanism for RSA
> PKCS#1 v1.5
> > ++decryption. When set (non zero value), the decryption API will return
> > ++a deterministically random value if the PKCS#1 v1.5 padding check
> fails.
> > ++This makes explotation of the Bleichenbacher significantly harder, ev=
en
> > ++if the code using the RSA decryption API is not implemented in
> side-channel
> > ++free manner. Set by default.
> > ++
> > + =3Dback
> > +
> > + OSSL_FUNC_asym_cipher_gettable_ctx_params() and
> OSSL_FUNC_asym_cipher_settable_ctx_params()
> > +diff --git a/include/crypto/rsa.h b/include/crypto/rsa.h
> > +index 949873d..f267e5d 100644
> > +--- a/include/crypto/rsa.h
> > ++++ b/include/crypto/rsa.h
> > +@@ -83,6 +83,10 @@ int ossl_rsa_param_decode(RSA *rsa, const X509_ALGO=
R
> *alg);
> > + RSA *ossl_rsa_key_from_pkcs8(const PKCS8_PRIV_KEY_INFO *p8inf,
> > +                              OSSL_LIB_CTX *libctx, const char *propq)=
;
> > +
> > ++int ossl_rsa_padding_check_PKCS1_type_2(OSSL_LIB_CTX *ctx,
> > ++                                        unsigned char *to, int tlen,
> > ++                                        const unsigned char *from, in=
t
> flen,
> > ++                                        int num, unsigned char *kdk);
> > + int ossl_rsa_padding_check_PKCS1_type_2_TLS(OSSL_LIB_CTX *ctx,
> unsigned char *to,
> > +                                             size_t tlen,
> > +                                             const unsigned char *from=
,
> > +diff --git a/include/openssl/core_names.h b/include/openssl/core_names=
.h
> > +index 6bed5a8..5a350b5 100644
> > +--- a/include/openssl/core_names.h
> > ++++ b/include/openssl/core_names.h
> > +@@ -292,6 +292,7 @@ extern "C" {
> > + #define OSSL_PKEY_PARAM_DIST_ID             "distid"
> > + #define OSSL_PKEY_PARAM_PUB_KEY             "pub"
> > + #define OSSL_PKEY_PARAM_PRIV_KEY            "priv"
> > ++#define OSSL_PKEY_PARAM_IMPLICIT_REJECTION  "implicit-rejection"
> > +
> > + /* Diffie-Hellman/DSA Parameters */
> > + #define OSSL_PKEY_PARAM_FFC_P               "p"
> > +@@ -467,6 +468,7 @@ extern "C" {
> > + #define OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL               "oaep-label"
> > + #define OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT_VERSION
>  "tls-client-version"
> > + #define OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSION
>  "tls-negotiated-version"
> > ++#define OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION
>  "implicit-rejection"
> > +
> > + /*
> > +  * Encoder / decoder parameters
> > +diff --git a/include/openssl/rsa.h b/include/openssl/rsa.h
> > +index a55c972..247f901 100644
> > +--- a/include/openssl/rsa.h
> > ++++ b/include/openssl/rsa.h
> > +@@ -183,6 +183,8 @@ int EVP_PKEY_CTX_get0_rsa_oaep_label(EVP_PKEY_CTX
> *ctx, unsigned char **label);
> > +
> > + # define EVP_PKEY_CTRL_RSA_KEYGEN_PRIMES  (EVP_PKEY_ALG_CTRL + 13)
> > +
> > ++# define EVP_PKEY_CTRL_RSA_IMPLICIT_REJECTION (EVP_PKEY_ALG_CTRL + 14=
)
> > ++
> > + # define RSA_PKCS1_PADDING          1
> > + # define RSA_NO_PADDING             3
> > + # define RSA_PKCS1_OAEP_PADDING     4
> > +@@ -192,6 +194,9 @@ int EVP_PKEY_CTX_get0_rsa_oaep_label(EVP_PKEY_CTX
> *ctx, unsigned char **label);
> > + # define RSA_PKCS1_PSS_PADDING      6
> > + # define RSA_PKCS1_WITH_TLS_PADDING 7
> > +
> > ++/* internal RSA_ only */
> > ++# define RSA_PKCS1_NO_IMPLICIT_REJECT_PADDING 8
> > ++
> > + # define RSA_PKCS1_PADDING_SIZE    11
> > +
> > + # define RSA_set_app_data(s,arg)         RSA_set_ex_data(s,0,arg)
> > +diff --git a/providers/implementations/asymciphers/rsa_enc.c
> b/providers/implementations/asymciphers/rsa_enc.c
> > +index c8921ac..11a91e6 100644
> > +--- a/providers/implementations/asymciphers/rsa_enc.c
> > ++++ b/providers/implementations/asymciphers/rsa_enc.c
> > +@@ -75,6 +75,8 @@ typedef struct {
> > +     /* TLS padding */
> > +     unsigned int client_version;
> > +     unsigned int alt_version;
> > ++    /* PKCS#1 v1.5 decryption mode */
> > ++    unsigned int implicit_rejection;
> > + } PROV_RSA_CTX;
> > +
> > + static void *rsa_newctx(void *provctx)
> > +@@ -107,6 +109,7 @@ static int rsa_init(void *vprsactx, void *vrsa,
> const OSSL_PARAM params[],
> > +     RSA_free(prsactx->rsa);
> > +     prsactx->rsa =3D vrsa;
> > +     prsactx->operation =3D operation;
> > ++    prsactx->implicit_rejection =3D 1;
> > +
> > +     switch (RSA_test_flags(prsactx->rsa, RSA_FLAG_TYPE_MASK)) {
> > +     case RSA_FLAG_TYPE_RSA:
> > +@@ -199,6 +202,7 @@ static int rsa_decrypt(void *vprsactx, unsigned
> char *out, size_t *outlen,
> > + {
> > +     PROV_RSA_CTX *prsactx =3D (PROV_RSA_CTX *)vprsactx;
> > +     int ret;
> > ++    int pad_mode;
> > +     size_t len =3D RSA_size(prsactx->rsa);
> > +
> > +     if (!ossl_prov_is_running())
> > +@@ -276,8 +280,12 @@ static int rsa_decrypt(void *vprsactx, unsigned
> char *out, size_t *outlen,
> > +         }
> > +         OPENSSL_free(tbuf);
> > +     } else {
> > +-        ret =3D RSA_private_decrypt(inlen, in, out, prsactx->rsa,
> > +-                                  prsactx->pad_mode);
> > ++        if ((prsactx->implicit_rejection =3D=3D 0) &&
> > ++                (prsactx->pad_mode =3D=3D RSA_PKCS1_PADDING))
> > ++            pad_mode =3D RSA_PKCS1_NO_IMPLICIT_REJECT_PADDING;
> > ++        else
> > ++            pad_mode =3D prsactx->pad_mode;
> > ++        ret =3D RSA_private_decrypt(inlen, in, out, prsactx->rsa,
> pad_mode);
> > +     }
> > +     *outlen =3D constant_time_select_s(constant_time_msb_s(ret),
> *outlen, ret);
> > +     ret =3D constant_time_select_int(constant_time_msb(ret), 0, 1);
> > +@@ -401,6 +409,10 @@ static int rsa_get_ctx_params(void *vprsactx,
> OSSL_PARAM *params)
> > +     if (p !=3D NULL && !OSSL_PARAM_set_uint(p, prsactx->alt_version))
> > +         return 0;
> > +
> > ++    p =3D OSSL_PARAM_locate(params,
> OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION);
> > ++    if (p !=3D NULL && !OSSL_PARAM_set_uint(p,
> prsactx->implicit_rejection))
> > ++        return 0;
> > ++
> > +     return 1;
> > + }
> > +
> > +@@ -412,6 +424,7 @@ static const OSSL_PARAM known_gettable_ctx_params[=
]
> =3D {
> > +                     NULL, 0),
> > +     OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT_VERSION, NULL),
> > +     OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSION,
> NULL),
> > ++    OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION, NULL),
> > +     OSSL_PARAM_END
> > + };
> > +
> > +@@ -549,6 +562,14 @@ static int rsa_set_ctx_params(void *vprsactx,
> const OSSL_PARAM params[])
> > +             return 0;
> > +         prsactx->alt_version =3D alt_version;
> > +     }
> > ++    p =3D OSSL_PARAM_locate_const(params,
> OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION);
> > ++    if (p !=3D NULL) {
> > ++        unsigned int implicit_rejection;
> > ++
> > ++        if (!OSSL_PARAM_get_uint(p, &implicit_rejection))
> > ++            return 0;
> > ++        prsactx->implicit_rejection =3D implicit_rejection;
> > ++    }
> > +
> > +     return 1;
> > + }
> > +@@ -562,6 +583,7 @@ static const OSSL_PARAM known_settable_ctx_params[=
]
> =3D {
> > +     OSSL_PARAM_octet_string(OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL, NULL,
> 0),
> > +     OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT_VERSION, NULL),
> > +     OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSION,
> NULL),
> > ++    OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION, NULL),
> > +     OSSL_PARAM_END
> > + };
> > +
> > +diff --git a/test/recipes/30-test_evp_data/evppkey_rsa_common.txt
> b/test/recipes/30-test_evp_data/evppkey_rsa_common.txt
> > +index 5f3b396..064d8a2 100644
> > +--- a/test/recipes/30-test_evp_data/evppkey_rsa_common.txt
> > ++++ b/test/recipes/30-test_evp_data/evppkey_rsa_common.txt
> > +@@ -253,10 +253,24 @@ Decrypt =3D RSA-2048
> > + Input =3D
> 550AF55A2904E7B9762352F8FB7FA235A9CB053AACB2D5FCB8CA48453CB2EE3619746C701=
ABF2D4CC67003471A187900B05AA812BD25ED05C675DFC8C97A24A7BF49BD6214992CAD766D=
05A9A2B57B74F26A737E0237B8B76C45F1F226A836D7CFBC75BA999BDBE48DBC09227AA46C8=
8F21DCCBA7840141AD5A5D71FD122E6BD6AC3E564780DFE623FC1CA9B995A6037BF0BBD43B2=
05A84AC5444F34202C05CE9113087176432476576DE6FFFF9A52EA57C08BE3EC2F49676CB8E=
12F762AC71FA3C321E00AC988910C85FF52F93825666CE0D40FFAA0592078919D4493F46D95=
CCF76364C6D57760DD0B64805F9AFC76A2365A5575CA301D5103F0EA76CB9A78
> > + Output =3D "Hello World"
> > +
> > ++# Note: disable the Bleichenbacher workaround to see if it passes
> > ++Decrypt =3D RSA-2048
> > ++Ctrl =3D rsa_pkcs1_implicit_rejection:0
> > ++Input =3D
> 550AF55A2904E7B9762352F8FB7FA235A9CB053AACB2D5FCB8CA48453CB2EE3619746C701=
ABF2D4CC67003471A187900B05AA812BD25ED05C675DFC8C97A24A7BF49BD6214992CAD766D=
05A9A2B57B74F26A737E0237B8B76C45F1F226A836D7CFBC75BA999BDBE48DBC09227AA46C8=
8F21DCCBA7840141AD5A5D71FD122E6BD6AC3E564780DFE623FC1CA9B995A6037BF0BBD43B2=
05A84AC5444F34202C05CE9113087176432476576DE6FFFF9A52EA57C08BE3EC2F49676CB8E=
12F762AC71FA3C321E00AC988910C85FF52F93825666CE0D40FFAA0592078919D4493F46D95=
CCF76364C6D57760DD0B64805F9AFC76A2365A5575CA301D5103F0EA76CB9A78
> > ++Output =3D "Hello World"
> > ++
> > + # Corrupted ciphertext
> > ++# Note: output is generated synthethically by the Bleichenbacher
> workaround
> > + FIPSversion =3D <3.2.0
> > + Decrypt =3D RSA-2048
> > + Input =3D
> 550AF55A2904E7B9762352F8FB7FA235A9CB053AACB2D5FCB8CA48453CB2EE3619746C701=
ABF2D4CC67003471A187900B05AA812BD25ED05C675DFC8C97A24A7BF49BD6214992CAD766D=
05A9A2B57B74F26A737E0237B8B76C45F1F226A836D7CFBC75BA999BDBE48DBC09227AA46C8=
8F21DCCBA7840141AD5A5D71FD122E6BD6AC3E564780DFE623FC1CA9B995A6037BF0BBD43B2=
05A84AC5444F34202C05CE9113087176432476576DE6FFFF9A52EA57C08BE3EC2F49676CB8E=
12F762AC71FA3C321E00AC988910C85FF52F93825666CE0D40FFAA0592078919D4493F46D95=
CCF76364C6D57760DD0B64805F9AFC76A2365A5575CA301D5103F0EA76CB9A79
> > ++Output =3D
> 4cbb988d6a46228379132b0b5f8c249b3860043848c93632fb982c807c7c82fffc7a9ef83=
f4908f890373ac181ffea6381e103bcaa27e65638b6ecebef38b59ed4226a9d12af675cfcb6=
34d8c40e7a7aff
> > ++
> > ++# Corrupted ciphertext
> > ++# Note: disable the Bleichenbacher workaround to see if it fails
> > ++Decrypt =3D RSA-2048
> > ++Ctrl =3D rsa_pkcs1_implicit_rejection:0
> > ++Input =3D
> 550AF55A2904E7B9762352F8FB7FA235A9CB053AACB2D5FCB8CA48453CB2EE3619746C701=
ABF2D4CC67003471A187900B05AA812BD25ED05C675DFC8C97A24A7BF49BD6214992CAD766D=
05A9A2B57B74F26A737E0237B8B76C45F1F226A836D7CFBC75BA999BDBE48DBC09227AA46C8=
8F21DCCBA7840141AD5A5D71FD122E6BD6AC3E564780DFE623FC1CA9B995A6037BF0BBD43B2=
05A84AC5444F34202C05CE9113087176432476576DE6FFFF9A52EA57C08BE3EC2F49676CB8E=
12F762AC71FA3C321E00AC988910C85FF52F93825666CE0D40FFAA0592078919D4493F46D95=
CCF76364C6D57760DD0B64805F9AFC76A2365A5575CA301D5103F0EA76CB9A79
> > + Output =3D "Hello World"
> > + Result =3D KEYOP_ERROR
> > +
> > +@@ -278,6 +292,462 @@ Derive =3D RSA-2048
> > + Result =3D KEYOP_INIT_ERROR
> > + Reason =3D operation not supported for this keytype
> > +
> > ++# Test vectors for the Bleichenbacher workaround
> > ++
> > ++PrivateKey =3D RSA-2048-2
> > ++-----BEGIN RSA PRIVATE KEY-----
> > ++MIIEowIBAAKCAQEAyMyDlxQJjaVsqiNkD5PciZfBY3KWj8Gwxt9RE8HJTosh5IrS
> > ++KX5lQZARtObY9ec7G3iyV0ADIdHva2AtTsjOjRQclJBetK0wZjmkkgZTS25/JgdC
> > ++Ppff/RM8iNchOZ3vvH6WzNy9fzquH+iScSv7SSmBfVEWZkQKH6y3ogj16hZZEK3Y
> > ++o/LUlyAjYMy2MgJPDQcWnBkY8xb3lLFDrvVOyHUipMApePlomYC/+/ZJwwfoGBm/
> > +++IQJY41IvZS+FStZ/2SfoL1inQ/6GBPDq/S1a9PC6lRl3/oUWJKSqdiiStJr5+4F
> > ++EHQbY4LUPIPVv6QKRmE9BivkRVF9vK8MtOGnaQIDAQABAoIBABRVAQ4PLVh2Y6Zm
> > ++pv8czbvw7dgQBkbQKgI5IpCJksStOeVWWSlybvZQjDpxFY7wtv91HTnQdYC7LS8G
> > ++MhBELQYD/1DbvXs1/iybsZpHoa+FpMJJAeAsqLWLeRmyDt8yqs+/Ua20vEthubfp
> > ++aMqk1XD3DvGNgGMiiJPkfUOe/KeTJZvPLNEIo9hojN8HjnrHmZafIznSwfUiuWlo
> > ++RimpM7quwmgWJeq4T05W9ER+nYj7mhmc9xAj4OJXsURBszyE07xnyoAx0mEmGBA6
> > ++egpAhEJi912IkM1hblH5A1SI/W4Jnej/bWWk/xGCVIB8n1jS+7qLoVHcjGi+NJyX
> > ++eiBOBMECgYEA+PWta6gokxvqRZuKP23AQdI0gkCcJXHpY/MfdIYColY3GziD7UWe
> > ++z5cFJkWe3RbgVSL1pF2UdRsuwtrycsf4gWpSwA0YCAFxY02omdeXMiL1G5N2MFSG
> > ++lqn32MJKWUl8HvzUVc+5fuhtK200lyszL9owPwSZm062tcwLsz53Yd0CgYEAznou
> > ++O0mpC5YzChLcaCvfvfuujdbcA7YUeu+9V1dD8PbaTYYjUGG3Gv2crS00Al5WrIaw
> > ++93Q+s14ay8ojeJVCRGW3Bu0iF15XGMjHC2cD6o9rUQ+UW+SOWja7PDyRcytYnfwF
> > ++1y2AkDGURSvaITSGR+xylD8RqEbmL66+jrU2sP0CgYB2/hXxiuI5zfHfa0RcpLxr
> > ++uWjXiMIZM6T13NKAAz1nEgYswIpt8gTB+9C+RjB0Q+bdSmRWN1Qp1OA4yiVvrxyb
> > ++3pHGsXt2+BmV+RxIy768e/DjSUwINZ5OjNalh9e5bWIh/X4PtcVXXwgu5XdpeYBx
> > ++sru0oyI4FRtHMUu2VHkDEQKBgQCZiEiwVUmaEAnLx9KUs2sf/fICDm5zZAU+lN4a
> > ++AA3JNAWH9+JydvaM32CNdTtjN3sDtvQITSwCfEs4lgpiM7qe2XOLdvEOp1vkVgeL
> > ++9wH2fMaz8/3BhuZDNsdrNy6AkQ7ICwrcwj0C+5rhBIaigkgHW06n5W3fzziC5FFW
> > ++FHGikQKBgGQ790ZCn32DZnoGUwITR++/wF5jUfghqd67YODszeUAWtnp7DHlWPfp
> > ++LCkyjnRWnXzvfHTKvCs1XtQBoaCRS048uwZITlgZYFEWntFMqi76bqBE4FTSYUTM
> > ++FinFUBBVigThM/RLfCRNrCW/kTxXuJDuSfVIJZzWNAT+9oWdz5da
> > ++-----END RSA PRIVATE KEY-----
> > ++
> > ++# corresponding public key
> > ++PublicKey =3D RSA-2048-2-PUBLIC
> > ++-----BEGIN PUBLIC KEY-----
> > ++MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyMyDlxQJjaVsqiNkD5Pc
> > ++iZfBY3KWj8Gwxt9RE8HJTosh5IrSKX5lQZARtObY9ec7G3iyV0ADIdHva2AtTsjO
> > ++jRQclJBetK0wZjmkkgZTS25/JgdCPpff/RM8iNchOZ3vvH6WzNy9fzquH+iScSv7
> > ++SSmBfVEWZkQKH6y3ogj16hZZEK3Yo/LUlyAjYMy2MgJPDQcWnBkY8xb3lLFDrvVO
> > ++yHUipMApePlomYC/+/ZJwwfoGBm/+IQJY41IvZS+FStZ/2SfoL1inQ/6GBPDq/S1
> > ++a9PC6lRl3/oUWJKSqdiiStJr5+4FEHQbY4LUPIPVv6QKRmE9BivkRVF9vK8MtOGn
> > ++aQIDAQAB
> > ++-----END PUBLIC KEY-----
> > ++
> > ++PrivPubKeyPair =3D RSA-2048-2:RSA-2048-2-PUBLIC
> > ++
> > ++# RSA decrypt
> > ++
> > ++# a random positive test case
> > ++Availablein =3D default
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> 8bfe264e85d3bdeaa6b8851b8e3b956ee3d226fd3f69063a86880173a273d9f283b2eebdd=
1ed35f7e02d91c571981b6737d5320bd8396b0f3ad5b019daec1b0aab3cbbc026395f4fd14f=
13673f2dfc81f9b660ec26ac381e6db3299b4e460b43fab9955df2b3cfaa20e900e19c85623=
8fd371899c2bf2ce8c868b76754e5db3b036533fd603746be13c10d4e3e6022ebc905d20c2a=
7f32b215a4cd53b3f44ca1c327d2c2b651145821c08396c89071f665349c25e44d2733cd930=
5985ceef6430c3cf57af5fa224089221218fa34737c79c446d28a94c41c96e4e92ac53fbcf3=
84dea8419ea089f8784445a492c812eb0d409467f75afd7d4d1078886205a066
> > ++Output =3D "lorem ipsum dolor sit amet"
> > ++
> > ++Availablein =3D default
> > ++# a random negative test case decrypting to empty
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> 20aaa8adbbc593a924ba1c5c7990b5c2242ae4b99d0fe636a19a4cf754edbcee774e472fe=
028160ed42634f8864900cb514006da642cae6ae8c7d087caebcfa6dad1551301e130344989=
a1d462d4164505f6393933450c67bc6d39d8f5160907cabc251b737925a1cf21e5c6aa5781b=
7769f6a2a583d97cce008c0f8b6add5f0b2bd80bee60237aa39bb20719fe75749f4bc4e4246=
6ef5a861ae3a92395c7d858d430bfe38040f445ea93fa2958b503539800ffa5ce5f8cf51fa8=
171a91f36cb4f4575e8de6b4d3f096ee140b938fd2f50ee13f0d050222e2a72b0a3069ff3a6=
738e82c87090caa5aed4fcbe882c49646aa250b98f12f83c8d528113614a29e7
> > ++Output =3D
> > ++
> > ++Availablein =3D default
> > ++# invalid decrypting to max length message
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> 48cceab10f39a4db32f60074feea473cbcdb7accf92e150417f76b44756b190e843e79ec1=
2aa85083a21f5437e7bad0a60482e601198f9d86923239c8786ee728285afd0937f7dde1271=
7f28389843d7375912b07b991f4fdb0190fced8ba665314367e8c5f9d2981d0f5128feeb46c=
b50fc237e64438a86df198dd0209364ae3a842d77532b66b7ef263b83b1541ed671b120dfd6=
60462e2107a4ee7b964e734a7bd68d90dda61770658a3c242948532da32648687e031828647=
3f675b412d6468f013f14d760a358dfcad3cda2afeec5e268a37d250c37f722f468a70dfd92=
d7294c3c1ee1e7f8843b7d16f9f37ef35748c3ae93aa155cdcdfeb4e78567303
> > ++Output =3D
> 22d850137b9eebe092b24f602dc5bb7918c16bd89ddbf20467b119d205f9c2e4bd7d2592c=
f1e532106e0f33557565923c73a02d4f09c0c22bea89148183e60317f7028b3aa1f261f91c9=
79393101d7e15f4067e63979b32751658ef769610fe97cf9cef3278b3117d384051c3b1d82c=
251c2305418c8f6840530e631aad63e70e20e025bcd8efb54c92ec6d3b106a2f8e64eeff7d3=
8495b0fc50c97138af4b1c0a67a1c4e27b077b8439332edfa8608dfeae653cd6a628ac55039=
5f7e74390e42c11682234870925eeaa1fa71b76cf1f2ee3bda69f6717033ff8b7c95c9799e7=
a3bea5e7e4a1c359772fb6b1c6e6c516661dfe30c3
> > ++
> > ++Availablein =3D default
> > ++# invalid decrypting to message with length specified by second to
> last value from PRF
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> 1439e08c3f84c1a7fec74ce07614b20e01f6fa4e8c2a6cffdc3520d8889e5d9a950c64257=
98f85d4be38d300ea5695f13ecd4cb389d1ff5b82484b494d6280ab7fa78e645933981cb934=
cce8bfcd114cc0e6811eefa47aae20af638a1cd163d2d3366186d0a07df0c81f6c9f3171cf3=
561472e98a6006bf75ddb457bed036dcce199369de7d94ef2c68e8467ee0604eea2b3009479=
162a7891ba5c40cab17f49e1c438cb6eaea4f76ce23cce0e483ff0e96fa790ea15be6767181=
4342d0a23f4a20262b6182e72f3a67cd289711503c85516a9ed225422f98b116f1ab080a80a=
bd6f0216df88d8cfd67c139243be8dd78502a7aaf6bc99d7da71bcdf627e7354
> > ++Output =3D 0f9b
> > ++
> > ++Availablein =3D default
> > ++# invalid decrypting to message with length specified by third to las=
t
> value from PRF
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> 1690ebcceece2ce024f382e467cf8510e74514120937978576caf684d4a02ad569e8d76cb=
e365a060e00779de2f0865ccf0d923de3b4783a4e2c74f422e2f326086c390b658ba47f31ab=
013aa80f468c71256e5fa5679b24e83cd82c3d1e05e398208155de2212993cd2b8bab6987cf=
4cc1293f19909219439d74127545e9ed8a706961b8ee2119f6bfacafbef91b75a789ba65b8b=
833bc6149cf49b5c4d2c6359f62808659ba6541e1cd24bf7f7410486b5103f6c0ea29334ea6=
f4975b17387474fe920710ea61568d7b7c0a7916acf21665ad5a31c4eabcde44f8fb6120d84=
57afa1f3c85d517cda364af620113ae5a3c52a048821731922737307f77a1081
> > ++Output =3D 4f02
> > ++
> > ++# positive test with 11 byte long value
> > ++Availablein =3D default
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> 6213634593332c485cef783ea2846e3d6e8b0e005cd8293eaebbaa5079712fd681579bdfb=
bda138ae4d9d952917a03c92398ec0cb2bb0c6b5a8d55061fed0d0d8d72473563152648cfe6=
40b335dc95331c21cb133a91790fa93ae44497c128708970d2beeb77e8721b061b1c4403414=
3734a77be8220877415a6dba073c3871605380542a9f25252a4babe8331cdd53cf828423f3c=
c70b560624d0581fb126b2ed4f4ed358f0eb8065cf176399ac1a846a31055f9ae8c9c24a1ba=
050bc20842125bc1753158f8065f3adb9cc16bfdf83816bdf38b624f12022c5a6fbfe29bc91=
542be8c0208a770bcd677dc597f5557dc2ce28a11bf3e3857f158717a33f6592
> > ++Output =3D "lorem ipsum"
> > ++
> > ++# positive test with 11 byte long value and zero padded ciphertext
> > ++Availablein =3D default
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> 00a2e8f114ea8d05d12dc843e3cc3b2edc8229ff2a028bda29ba9d55e3cd02911902fef1f=
42a075bf05e8016e8567213d6f260fa49e360779dd81aeea3e04c2cb567e0d72b98bf754014=
561b7511e083d20e0bfb9cd23f8a0d3c88900c49d2fcd5843ff0765607b2026f28202a87aa9=
4678aed22a0c20724541394cd8f44e373eba1d2bae98f516c1e2ba3d86852d064f856b1daf2=
4795e767a2b90396e50743e3150664afab131fe40ea405dcf572dd1079af1d3f0392ccadcca=
0a12740dbb213b925ca2a06b1bc1383e83a658c82ba2e7427342379084d5f66b544579f0766=
4cb26edd4f10fd913fdbc0de05ef887d4d1ec1ac95652397ea7fd4e4759fda8b
> > ++Output =3D "lorem ipsum"
> > ++
> > ++# positive test with 11 byte long value and zero truncated ciphertext
> > ++Availablein =3D default
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> a2e8f114ea8d05d12dc843e3cc3b2edc8229ff2a028bda29ba9d55e3cd02911902fef1f42=
a075bf05e8016e8567213d6f260fa49e360779dd81aeea3e04c2cb567e0d72b98bf75401456=
1b7511e083d20e0bfb9cd23f8a0d3c88900c49d2fcd5843ff0765607b2026f28202a87aa946=
78aed22a0c20724541394cd8f44e373eba1d2bae98f516c1e2ba3d86852d064f856b1daf247=
95e767a2b90396e50743e3150664afab131fe40ea405dcf572dd1079af1d3f0392ccadcca0a=
12740dbb213b925ca2a06b1bc1383e83a658c82ba2e7427342379084d5f66b544579f07664c=
b26edd4f10fd913fdbc0de05ef887d4d1ec1ac95652397ea7fd4e4759fda8b
> > ++Output =3D "lorem ipsum"
> > ++
> > ++# positive test with 11 byte long value and double zero padded
> ciphertext
> > ++Availablein =3D default
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> 00001f71879b426127f7dead621f7380a7098cf7d22173aa27991b143c46d53383c209bd0=
c9c00d84078037e715f6b98c65005a77120070522ede51d472c87ef94b94ead4c5428ee108a=
345561658301911ec5a8f7dd43ed4a3957fd29fb02a3529bf63f8040d3953490939bd8f78b2=
a3404b6fb5ff70a4bfdaac5c541d6bcce49c9778cc390be24cbef1d1eca7e870457241d3ff7=
2ca44f9f56bdf31a890fa5eb3a9107b603ccc9d06a5dd911a664c82b6abd4fe036f8db8d5a0=
70c2d86386ae18d97adc1847640c211d91ff5c3387574a26f8ef27ca7f48d2dd1f0c7f14b81=
cc9d33ee6853031d3ecf10a914ffd90947909c8011fd30249219348ebff76bfc
> > ++Output =3D "lorem ipsum"
> > ++
> > ++# positive test with 11 byte long value and double zero truncated
> ciphertext
> > ++Availablein =3D default
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> 1f71879b426127f7dead621f7380a7098cf7d22173aa27991b143c46d53383c209bd0c9c0=
0d84078037e715f6b98c65005a77120070522ede51d472c87ef94b94ead4c5428ee108a3455=
61658301911ec5a8f7dd43ed4a3957fd29fb02a3529bf63f8040d3953490939bd8f78b2a340=
4b6fb5ff70a4bfdaac5c541d6bcce49c9778cc390be24cbef1d1eca7e870457241d3ff72ca4=
4f9f56bdf31a890fa5eb3a9107b603ccc9d06a5dd911a664c82b6abd4fe036f8db8d5a070c2=
d86386ae18d97adc1847640c211d91ff5c3387574a26f8ef27ca7f48d2dd1f0c7f14b81cc9d=
33ee6853031d3ecf10a914ffd90947909c8011fd30249219348ebff76bfc
> > ++Output =3D "lorem ipsum"
> > ++
> > ++# positive that generates a 0 byte long synthethic message internally
> > ++Availablein =3D default
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> b5e49308f6e9590014ffaffc5b8560755739dd501f1d4e9227a7d291408cf4b753f292322=
ff8bead613bf2caa181b221bc38caf6392deafb28eb21ad60930841ed02fd6225cc9c463409=
adbe7d8f32440212fbe3881c51375bb09565efb22e62b071472fb38676e5b4e23a0617db5d1=
4d93519ac0007a30a9c822eb31c38b57fcb1be29608fcf1ca2abdcaf5d5752bbc2b5ac7dba5=
afcff4a5641da360dd01f7112539b1ed46cdb550a3b1006559b9fe1891030ec80f0727c4240=
1ddd6cbb5e3c80f312df6ec89394c5a7118f573105e7ab00fe57833c126141b50a935224842=
addfb479f75160659ba28877b512bb9a93084ad8bec540f92640f63a11a010e0
> > ++Output =3D "lorem ipsum"
> > ++
> > ++# positive that generates a 245 byte long synthethic message internal=
ly
> > ++Availablein =3D default
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> 1ea0b50ca65203d0a09280d39704b24fe6e47800189db5033f202761a78bafb270c5e25ab=
d1f7ecc6e7abc4f26d1b0cd9b8c648d529416ee64ccbdd7aa72a771d0353262b543f0e43607=
6f40a1095f5c7dfd10dcf0059ccb30e92dfa5e0156618215f1c3ff3aa997a9d999e506924f5=
289e3ac72e5e2086cc7b499d71583ed561028671155db4005bee01800a7cdbdae781dd32199=
b8914b5d4011dd6ff11cd26d46aad54934d293b0bc403dd211bf13b5a5c6836a5e769930f43=
7ffd8634fb7371776f4bc88fa6c271d8aa6013df89ae6470154497c4ac861be2a1c65ebffec=
139bf7aaba3a81c7c5cdd84da9af5d3edfb957848074686b5837ecbcb6a41c50
> > ++Output =3D "lorem ipsum"
> > ++
> > ++Availablein =3D default
> > ++# a random negative test that generates an 11 byte long message
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> 5f02f4b1f46935c742ebe62b6f05aa0a3286aab91a49b34780adde6410ab46f7386e05748=
331864ac98e1da63686e4babe3a19ed40a7f5ceefb89179596aab07ab1015e03b8f825084da=
b028b6731288f2e511a4b314b6ea3997d2e8fe2825cef8897cbbdfb6c939d441d6e04948414=
bb69e682927ef8576c9a7090d4aad0e74c520d6d5ce63a154720f00b76de8cc550b1aa14f01=
6d63a7b6d6eaa1f7dbe9e50200d3159b3d099c900116bf4eba3b94204f18b1317b07529751a=
bf64a26b0a0bf1c8ce757333b3d673211b67cc0653f2fe2620d57c8b6ee574a0323a167eab1=
106d9bc7fd90d415be5f1e9891a0e6c709f4fc0404e8226f8477b4e939b36eb2
> > ++Output =3D af9ac70191c92413cb9f2d
> > ++
> > ++Availablein =3D default
> > ++# an otherwise correct plaintext, but with wrong first byte
> > ++# (0x01 instead of 0x00), generates a random 11 byte long plaintext
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> 9b2ec9c0c917c98f1ad3d0119aec6be51ae3106e9af1914d48600ab6a2c0c0c8ae02a2dc3=
039906ff3aac904af32ec798fd65f3ad1afa2e69400e7c1de81f5728f3b3291f38263bc7a90=
a0563e43ce7a0d4ee9c0d8a716621ca5d3d081188769ce1b131af7d35b13dea99153579c86d=
b31fe07d5a2c14d621b77854e48a8df41b5798563af489a291e417b6a334c63222627376118=
c02c53b6e86310f728734ffc86ef9d7c8bf56c0c841b24b82b59f51aee4526ba1c4268506d3=
01e4ebc498c6aebb6fd5258c876bf900bac8ca4d309dd522f6a6343599a8bc3760f422c10c7=
2d0ad527ce4af1874124ace3d99bb74db8d69d2528db22c3a37644640f95c05f
> > ++Output =3D a1f8c9255c35cfba403ccc
> > ++
> > ++Availablein =3D default
> > ++# an otherwise correct plaintext, but with wrong second byte
> > ++# (0x01 instead of 0x02), generates a random 11 byte long plaintext
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> 782c2b59a21a511243820acedd567c136f6d3090c115232a82a5efb0b178285f55b5ec2d2=
bac96bf00d6592ea7cdc3341610c8fb07e527e5e2d20cfaf2c7f23e375431f45e998929a02f=
25fd95354c33838090bca838502259e92d86d568bc2cdb132fab2a399593ca60a015dc2bb1a=
fcd64fef8a3834e17e5358d822980dc446e845b3ab4702b1ee41fe5db716d92348d5091c15d=
35a110555a35deb4650a5a1d2c98025d42d4544f8b32aa6a5e02dc02deaed9a7313b73b49b0=
d4772a3768b0ea0db5846ace6569cae677bf67fb0acf3c255dc01ec8400c963b6e49b106772=
8b4e563d7e1e1515664347b92ee64db7efb5452357a02fff7fcb7437abc2e579
> > ++Output =3D e6d700309ca0ed62452254
> > ++
> > ++Availablein =3D default
> > ++# an invalid ciphertext, with a zero byte in first byte of
> > ++# ciphertext, decrypts to a random 11 byte long synthethic
> > ++# plaintext
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> 0096136621faf36d5290b16bd26295de27f895d1faa51c800dafce73d001d60796cd4e2ac=
3fa2162131d859cd9da5a0c8a42281d9a63e5f353971b72e36b5722e4ac444d77f892a5443d=
eb3dca49fa732fe855727196e23c26eeac55eeced8267a209ebc0f92f4656d64a6c13f7f7ce=
544ebeb0f668fe3a6c0f189e4bcd5ea12b73cf63e0c8350ee130dd62f01e5c97a1e13f52fde=
96a9a1bc9936ce734fdd61f27b18216f1d6de87f49cf4f2ea821fb8efd1f92cdad529baf7e3=
1aff9bff4074f2cad2b4243dd15a711adcf7de900851fbd6bcb53dac399d7c880531d06f25f=
7002e1aaf1722765865d2c2b902c7736acd27bc6cbd3e38b560e2eecf7d4b576
> > ++Output =3D ba27b1842e7c21c0e7ef6a
> > ++
> > ++Availablein =3D default
> > ++# an invalid ciphertext, with a zero byte removed from first byte of
> > ++# ciphertext, decrypts to a random 11 byte long synthethic
> > ++# plaintext
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> 96136621faf36d5290b16bd26295de27f895d1faa51c800dafce73d001d60796cd4e2ac3f=
a2162131d859cd9da5a0c8a42281d9a63e5f353971b72e36b5722e4ac444d77f892a5443deb=
3dca49fa732fe855727196e23c26eeac55eeced8267a209ebc0f92f4656d64a6c13f7f7ce54=
4ebeb0f668fe3a6c0f189e4bcd5ea12b73cf63e0c8350ee130dd62f01e5c97a1e13f52fde96=
a9a1bc9936ce734fdd61f27b18216f1d6de87f49cf4f2ea821fb8efd1f92cdad529baf7e31a=
ff9bff4074f2cad2b4243dd15a711adcf7de900851fbd6bcb53dac399d7c880531d06f25f70=
02e1aaf1722765865d2c2b902c7736acd27bc6cbd3e38b560e2eecf7d4b576
> > ++Output =3D ba27b1842e7c21c0e7ef6a
> > ++
> > ++Availablein =3D default
> > ++# an invalid ciphertext, with two zero bytes in first bytes of
> > ++# ciphertext, decrypts to a random 11 byte long synthethic
> > ++# plaintext
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> 0000587cccc6b264bdfe0dc2149a988047fa921801f3502ea64624c510c6033d2f427e3f1=
36c26e88ea9f6519e86a542cec96aad1e5e9013c3cc203b6de15a69183050813af5c9ad7970=
3136d4b92f50ce171eefc6aa7988ecf02f319ffc5eafd6ee7a137f8fce64b255bb1b8dd19cf=
e767d64fdb468b9b2e9e7a0c24dae03239c8c714d3f40b7ee9c4e59ac15b17e4d328f110075=
6bce17133e8e7493b54e5006c3cbcdacd134130c5132a1edebdbd01a0c41452d16ed7a07880=
03c34730d0808e7e14c797a21f2b45a8aa1644357fd5e988f99b017d9df37563a354c788dc0=
e2f9466045622fa3f3e17db63414d27761f57392623a2bef6467501c63e8d645
> > ++Output =3D d5cf555b1d6151029a429a
> > ++
> > ++Availablein =3D default
> > ++# an invalid ciphertext, with two zero bytes removed from first bytes
> of
> > ++# ciphertext, decrypts to a random 11 byte long synthethic
> > ++# plaintext
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> 587cccc6b264bdfe0dc2149a988047fa921801f3502ea64624c510c6033d2f427e3f136c2=
6e88ea9f6519e86a542cec96aad1e5e9013c3cc203b6de15a69183050813af5c9ad79703136=
d4b92f50ce171eefc6aa7988ecf02f319ffc5eafd6ee7a137f8fce64b255bb1b8dd19cfe767=
d64fdb468b9b2e9e7a0c24dae03239c8c714d3f40b7ee9c4e59ac15b17e4d328f1100756bce=
17133e8e7493b54e5006c3cbcdacd134130c5132a1edebdbd01a0c41452d16ed7a0788003c3=
4730d0808e7e14c797a21f2b45a8aa1644357fd5e988f99b017d9df37563a354c788dc0e2f9=
466045622fa3f3e17db63414d27761f57392623a2bef6467501c63e8d645
> > ++Output =3D d5cf555b1d6151029a429a
> > ++
> > ++Availablein =3D default
> > ++# and invalid ciphertext, otherwise valid but starting with 000002,
> decrypts
> > ++# to random 11 byte long synthethic plaintext
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> 1786550ce8d8433052e01ecba8b76d3019f1355b212ac9d0f5191b023325a7e7714b7802f=
8e9a17c4cb3cd3a84041891471b10ca1fcfb5d041d34c82e6d0011cf4dc76b90e9c2e074359=
0579d55bcd7857057152c4a8040361343d1d22ba677d62b011407c652e234b1d663af25e238=
6251d7409190f19fc8ec3f9374fdf1254633874ce2ec2bff40ad0cb473f9761ec7b68da45a4=
bd5e33f5d7dac9b9a20821df9406b653f78a95a6c0ea0a4d57f867e4db22c17bf9a12c150f8=
09a7b72b6db86c22a8732241ebf3c6a4f2cf82671d917aba8bc61052b40ccddd743a94ea9b5=
38175106201971cca9d136d25081739aaf6cd18b2aecf9ad320ea3f89502f955
> > ++Output =3D 3d4a054d9358209e9cbbb9
> > ++
> > ++Availablein =3D default
> > ++# negative test with otherwise valid padding but a zero byte in first
> byte
> > ++# of padding
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> 179598823812d2c58a7eb50521150a48bcca8b4eb53414018b6bca19f4801456c5e36a940=
037ac516b0d6412ba44ec6b4f268a55ef1c5ffbf18a2f4e3522bb7b6ed89774b79bffa22f7d=
3102165565642de0d43a955e96a1f2e80e5430671d7266eb4f905dc8ff5e106dc5588e5b028=
9e49a4913940e392a97062616d2bda38155471b7d360cfb94681c702f60ed2d4de614ea72bf=
1c53160e63179f6c5b897b59492bee219108309f0b7b8cb2b136c346a5e98b8b4b8415fb1d7=
13bae067911e3057f1c335b4b7e39101eafd5d28f0189037e4334f4fdb9038427b1d119a670=
2aa8233319cc97d496cc289ae8c956ddc84042659a2d43d6aa22f12b81ab884e
> > ++Output =3D 1f037dd717b07d3e7f7359
> > ++
> > ++Availablein =3D default
> > ++# negative test with otherwise valid padding but a zero byte at the
> eigth
> > ++# byte of padding
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> a7a340675a82c30e22219a55bc07cdf36d47d01834c1834f917f18b517419ce9de2a96460=
e745024436470ed85e94297b283537d52189c406a3f533cb405cc6a9dba46b482ce98b6e3dd=
52d8fce2237425617e38c11fbc46b61897ef200d01e4f25f5f6c4c5b38cd0de38ba11908b86=
595a8036a08a42a3d05b79600a97ac18ba368a08d6cf6ccb624f6e8002afc75599fba4de3d4=
f3ba7d208391ebe8d21f8282b18e2c10869eb2702e68f9176b42b0ddc9d763f0c86ba0ff92c=
957aaeab76d9ab8da52ea297ec11d92d770146faa1b300e0f91ef969b53e7d2907ffc984e9a=
9c9d11fb7d6cba91972059b46506b035efec6575c46d7114a6b935864858445f
> > ++Output =3D 63cb0bf65fc8255dd29e17
> > ++
> > ++Availablein =3D default
> > ++# negative test with an otherwise valid plaintext but with missing
> separator
> > ++# byte
> > ++Decrypt =3D RSA-2048-2
> > ++Input =3D
> 3d1b97e7aa34eaf1f4fc171ceb11dcfffd9a46a5b6961205b10b302818c1fcc9f4ec78bf1=
8ea0cee7e9fa5b16fb4c611463b368b3312ac11cf9c06b7cf72b54e284848a508d3f02328c6=
2c2999d0fb60929f81783c7a256891bc2ff4d91df2af96a24fc5701a1823af939ce6dbdc510=
608e3d41eec172ad2d51b9fc61b4217c923cadcf5bac321355ef8be5e5f090cdc2bd0c697d9=
058247db3ad613fdce87d2955a6d1c948a5160f93da21f731d74137f5d1f53a1923adb513d2=
e6e1589d44cc079f4c6ddd471d38ac82d20d8b1d21f8d65f3b6907086809f4123e08d86fb38=
729585de026a485d8f0e703fd4772f6668febf67df947b82195fa3867e3a3065
> > ++Output =3D 6f09a0b62699337c497b0b
> > ++
> > ++# Test vectors for the Bleichenbacher workaround (2049 bit key size)
> > ++
> > ++PrivateKey =3D RSA-2049
> > ++-----BEGIN RSA PRIVATE KEY-----
> > ++MIIEpQIBAAKCAQEBVfiJVWoXdfHHp3hqULGLwoyemG7eVmfKs5uEEk6Q66dcHbCD
> > ++rD5EO7qU3CNWD3XjqBaToqQ73HQm2MTq/mjIXeD+dX9uSbue1EfmAkMIANuwTOsi
> > ++5/pXoY0zj7ZgJs20Z+cMwEDn02fvQDx78ePfYkZQCUYx8h6v0vtbyRX/BDeazRES
> > ++9zLAtGYHwXjTiiD1LtpQny+cBAXVEGnoDM+UFVTQRwRnUFw89UHqCJffyfQAzssp
> > ++j/x1M3LZ9pM68XTMQO2W1GcDFzO5f4zd0/krw6A+qFdsQX8kAHteT3UBEFtUTen6
> > ++3N/635jftLsFuBmfP4Ws/ZH3qaCUuaOD9QSQlwIDAQABAoIBAQEZwrP1CnrWFSZ5
> > ++1/9RCVisLYym8AKFkvMy1VoWc2F4qOZ/F+cFzjAOPodUclEAYBP5dNCj20nvNEyl
> > ++omo0wEUHBNDkIuDOI6aUJcFf77bybhBu7/ZMyLnXRC5NpOjIUAjq6zZYWaIpT6OT
> > ++e8Jr5WMy59geLBYO9jXMUoqnvlXmM6cj28Hha6KeUrKa7y+eVlT9wGZrsPwlSsvo
> > ++DmOHTw9fAgeC48nc/CUg0MnEp7Y05FA/u0k+Gq/us/iL16EzmHJdrm/jmed1zV1M
> > ++8J/IODR8TJjasaSIPM5iBRNhWvqhCmM2jm17ed9BZqsWJznvUVpEAu4eBgHFpVvH
> > ++HfDjDt+BAoGBAYj2k2DwHhjZot4pUlPSUsMeRHbOpf97+EE99/3jVlI83JdoBfhP
> > ++wN3sdw3wbO0GXIETSHVLNGrxaXVod/07PVaGgsh4fQsxTvasZ9ZegTM5i2Kgg8D4
> > ++dlxa1A1agfm73OJSftfpUAjLECnLTKvR+em+38KGyWVSJV2n6rGSF473AoGBAN7H
> > ++zxHa3oOkxD0vgBl/If1dRv1XtDH0T+gaHeN/agkf/ARk7ZcdyFCINa3mzF9Wbzll
> > ++YTqLNnmMkubiP1LvkH6VZ+NBvrxTNxiWJfu+qx87ez+S/7JoHm71p4SowtePfC2J
> > ++qqok0s7b0GaBz+ZcNse/o8W6E1FiIi71wukUyYNhAoGAEgk/OnPK7dkPYKME5FQC
> > +++HGrMsjJVbCa9GOjvkNw8tVYSpq7q2n9sDHqRPmEBl0EYehAqyGIhmAONxVUbIsL
> > ++ha0m04y0MI9S0H+ZRH2R8IfzndNAONsuk46XrQU6cfvtZ3Xh3IcY5U5sr35lRn2c
> > ++ut3H52XIWJ4smN/cJcpOyoECgYEAjM5hNHnPlgj392wkXPkbtJXWHp3mSISQVLTd
> > ++G0MW8/mBQg3AlXi/eRb+RpHPrppk5jQLhgMjRSPyXXe2amb8PuWTqfGN6l32PtX3
> > ++3+udILpppb71Wf+w7JTbcl9v9uq7o9SVR8DKdPA+AeweSQ0TmqCnlHuNZizOSjwP
> > ++G16GF0ECgYEA+ZWbNMS8qM5IiHgbMbHptdit9dDT4+1UXoNn0/hUW6ZEMriHMDXv
> > ++iBwrzeANGAn5LEDYeDe1xPms9Is2uNxTpZVhpFZSNALR6Po68wDlTJG2PmzuBv5t
> > ++5mbzkpWCoD4fRU53ifsHgaTW+7Um74gWIf0erNIUZuTN2YrtEPTnb3k=3D
> > ++-----END RSA PRIVATE KEY-----
> > ++
> > ++# corresponding public key
> > ++PublicKey =3D RSA-2049-PUBLIC
> > ++-----BEGIN PUBLIC KEY-----
> > ++MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEBVfiJVWoXdfHHp3hqULGL
> > ++woyemG7eVmfKs5uEEk6Q66dcHbCDrD5EO7qU3CNWD3XjqBaToqQ73HQm2MTq/mjI
> > ++XeD+dX9uSbue1EfmAkMIANuwTOsi5/pXoY0zj7ZgJs20Z+cMwEDn02fvQDx78ePf
> > ++YkZQCUYx8h6v0vtbyRX/BDeazRES9zLAtGYHwXjTiiD1LtpQny+cBAXVEGnoDM+U
> > ++FVTQRwRnUFw89UHqCJffyfQAzsspj/x1M3LZ9pM68XTMQO2W1GcDFzO5f4zd0/kr
> > ++w6A+qFdsQX8kAHteT3UBEFtUTen63N/635jftLsFuBmfP4Ws/ZH3qaCUuaOD9QSQ
> > ++lwIDAQAB
> > ++-----END PUBLIC KEY-----
> > ++
> > ++PrivPubKeyPair =3D RSA-2049:RSA-2049-PUBLIC
> > ++
> > ++# RSA decrypt
> > ++
> > ++Availablein =3D default
> > ++# malformed that generates length specified by 3rd last value from PR=
F
> > ++Decrypt =3D RSA-2049
> > ++Input =3D
> 00b26f6404b82649629f2704494282443776929122e279a9cf30b0c6fe8122a0a9042870d=
97cc8ef65490fe58f031eb2442352191f5fbc311026b5147d32df914599f38b825ebb824af0=
d63f2d541a245c5775d1c4b78630e4996cc5fe413d38455a776cf4edcc0aa7fccb31c584d60=
502ed2b77398f536e137ff7ba6430e9258e21c2db5b82f5380f566876110ac4c759178900fb=
ad7ab70ea07b1daf7a1639cbb4196543a6cbe8271f35dddb8120304f6eef83059e1c5c56787=
10f904a6d760c4d1d8ad076be17904b9e69910040b47914a0176fb7eea0c06444a6c4b86d67=
4d19a556a1de5490373cb01ce31bbd15a5633362d3d2cd7d4af1b4c5121288b894
> > ++Output =3D 42
> > ++
> > ++# simple positive test case
> > ++Availablein =3D default
> > ++Decrypt =3D RSA-2049
> > ++Input =3D
> 013300edbf0bb3571e59889f7ed76970bf6d57e1c89bbb6d1c3991d9df8e65ed54b556d92=
8da7d768facb395bbcc81e9f8573b45cf8195dbd85d83a59281cddf4163aec11b53b4140053=
e3bd109f787a7c3cec31d535af1f50e0598d85d96d91ea01913d07097d25af99c67464ebf2b=
b396fb28a9233e56f31f7e105d71a23e9ef3b736d1e80e713d1691713df97334779552fc94b=
40dd733c7251bc522b673d3ec9354af3dd4ad44fa71c0662213a57ada1d75149697d0eb55c0=
53aaed5ffd0b815832f454179519d3736fb4faf808416071db0d0f801aca8548311ee708c13=
1f4be658b15f6b54256872c2903ac708bd43b017b073b5707bc84c2cd9da70e967
> > ++Output =3D "lorem ipsum"
> > ++
> > ++# positive test case with null padded ciphertext
> > ++Availablein =3D default
> > ++Decrypt =3D RSA-2049
> > ++Input =3D
> 0002aadf846a329fadc6760980303dbd87bfadfa78c2015ce4d6c5782fd9d3f1078bd3c0a=
2c5bfbdd1c024552e5054d98b5bcdc94e476dd280e64d650089326542ce7c61d4f1ab40004c=
2e6a88a883613568556a10f3f9edeab67ae8dddc1e6b0831c2793d2715de943f7ce34c5c05d=
1b09f14431fde566d17e76c9feee90d86a2c158616ec81dda0c642f58c0ba8fa4495843124a=
7235d46fb4069715a51bf710fd024259131ba94da73597ace494856c94e7a3ec261545793b0=
990279b15fa91c7fd13dbfb1df2f221dab9fa9f7c1d21e48aa49f6aaecbabf5ee76dc6c2af2=
317ffb4e303115386a97f8729afc3d0c89419669235f1a3a69570e0836c79fc162
> > ++Output =3D "lorem ipsum"
> > ++
> > ++# positive test case with null truncated ciphertext
> > ++Availablein =3D default
> > ++Decrypt =3D RSA-2049
> > ++Input =3D
> 02aadf846a329fadc6760980303dbd87bfadfa78c2015ce4d6c5782fd9d3f1078bd3c0a2c=
5bfbdd1c024552e5054d98b5bcdc94e476dd280e64d650089326542ce7c61d4f1ab40004c2e=
6a88a883613568556a10f3f9edeab67ae8dddc1e6b0831c2793d2715de943f7ce34c5c05d1b=
09f14431fde566d17e76c9feee90d86a2c158616ec81dda0c642f58c0ba8fa4495843124a72=
35d46fb4069715a51bf710fd024259131ba94da73597ace494856c94e7a3ec261545793b099=
0279b15fa91c7fd13dbfb1df2f221dab9fa9f7c1d21e48aa49f6aaecbabf5ee76dc6c2af231=
7ffb4e303115386a97f8729afc3d0c89419669235f1a3a69570e0836c79fc162
> > ++Output =3D "lorem ipsum"
> > ++
> > ++# positive test case with double null padded ciphertext
> > ++Availablein =3D default
> > ++Decrypt =3D RSA-2049
> > ++Input =3D
> 0000f36da3b72d8ff6ded74e7efd08c01908f3f5f0de7b55eab92b5f875190809c39d4162=
e1e6649618f854fd84aeab03970d16bb814e999852c06de38d82b95c0f32e2a7b5714021fe3=
03389be9c0eac24c90a6b7210f929d390fabf903d44e04110bb7a7fd6c383c275804721efa6=
d7c93aa64c0bb2b18d97c5220a846c66a4895ae52adddbe2a9996825e013585adcec4b32ba6=
1d782737bd343e5fabd68e8a95b8b1340318559860792dd70dffbe05a1052b54cbfb48cfa7b=
b3c19cea52076bddac5c25ee276f153a610f6d06ed696d192d8ae4507ffae4e5bdda10a625d=
6b67f32f7cffcd48dee2431fe66f6105f9d17e611cdcc674868e81692a360f4052
> > ++Output =3D "lorem ipsum"
> > ++
> > ++# positive test case with double null truncated ciphertext
> > ++Availablein =3D default
> > ++Decrypt =3D RSA-2049
> > ++Input =3D
> f36da3b72d8ff6ded74e7efd08c01908f3f5f0de7b55eab92b5f875190809c39d4162e1e6=
649618f854fd84aeab03970d16bb814e999852c06de38d82b95c0f32e2a7b5714021fe30338=
9be9c0eac24c90a6b7210f929d390fabf903d44e04110bb7a7fd6c383c275804721efa6d7c9=
3aa64c0bb2b18d97c5220a846c66a4895ae52adddbe2a9996825e013585adcec4b32ba61d78=
2737bd343e5fabd68e8a95b8b1340318559860792dd70dffbe05a1052b54cbfb48cfa7bb3c1=
9cea52076bddac5c25ee276f153a610f6d06ed696d192d8ae4507ffae4e5bdda10a625d6b67=
f32f7cffcd48dee2431fe66f6105f9d17e611cdcc674868e81692a360f4052
> > ++Output =3D "lorem ipsum"
> > ++
> > ++Availablein =3D default
> > ++# a random negative test case that generates an 11 byte long message
> > ++Decrypt =3D RSA-2049
> > ++Input =3D
> 00f910200830fc8fff478e99e145f1474b312e2512d0f90b8cef77f8001d09861688c156d=
1cbaf8a8957f7ebf35f724466952d0524cad48aad4fba1e45ce8ea27e8f3ba44131b7831b62=
d60c0762661f4c1d1a88cd06263a259abf1ba9e6b0b172069afb86a7e88387726f8ab3adb30=
bfd6b3f6be6d85d5dfd044e7ef052395474a9cbb1c3667a92780b43a22693015af6c513041b=
daf87d43b24ddd244e791eeaea1066e1f4917117b3a468e22e0f7358852bb981248de4d720a=
dd2d15dccba6280355935b67c96f9dcb6c419cc38ab9f6fba2d649ef2066e0c34c9f788ae49=
babd9025fa85b21113e56ce4f43aa134c512b030dd7ac7ce82e76f0be9ce09ebca
> > ++Output =3D 1189b6f5498fd6df532b00
> > ++
> > ++Availablein =3D default
> > ++# otherwise correct plaintext, but with wrong first byte (0x01 instea=
d
> of 0x00)
> > ++Decrypt =3D RSA-2049
> > ++Input =3D
> 002c9ddc36ba4cf0038692b2d3a1c61a4bb3786a97ce2e46a3ba74d03158aeef456ce0f4d=
b04dda3fe062268a1711250a18c69778a6280d88e133a16254e1f0e30ce8dac9b57d2e39a2f=
7d7be3ee4e08aec2fdbe8dadad7fdbf442a29a8fb40857407bf6be35596b8eefb5c2b3f58b8=
94452c2dc54a6123a1a38d642e23751746597e08d71ac92704adc17803b19e131b4d1927881=
f43b0200e6f95658f559f912c889b4cd51862784364896cd6e8618f485a992f82997ad6a091=
7e32ae5872eaf850092b2d6c782ad35f487b79682333c1750c685d7d32ab3e1538f31dcaa5e=
7d5d2825875242c83947308dcf63ba4bfff20334c9c140c837dbdbae7a8dee72ff
> > ++Output =3D f6d0f5b78082fe61c04674
> > ++
> > ++Availablein =3D default
> > ++# otherwise correct plaintext, but with wrong second byte (0x01
> instead of 0x02)
> > ++Decrypt =3D RSA-2049
> > ++Input =3D
> 00c5d77826c1ab7a34d6390f9d342d5dbe848942e2618287952ba0350d7de6726112e9ceb=
c391a0fae1839e2bf168229e3e0d71d4161801509f1f28f6e1487ca52df05c466b6b0a6fbbe=
57a3268a970610ec0beac39ec0fa67babce1ef2a86bf77466dc127d7d0d2962c20e66593126=
f276863cd38dc6351428f884c1384f67cad0a0ffdbc2af16711fb68dc559b96b37b4f04cd13=
3ffc7d79c43c42ca4948fa895b9daeb853150c8a5169849b730cc77d68b0217d6c0e3dbf38d=
751a1998186633418367e7576530566c23d6d4e0da9b038d0bb5169ce40133ea076472d0550=
01f0135645940fd08ea44269af2604c8b1ba225053d6db9ab43577689401bdc0f3
> > ++Output =3D 1ab287fcef3ff17067914d
> > ++
> > ++# RSA decrypt with 3072 bit keys
> > ++PrivateKey =3D RSA-3072
> > ++-----BEGIN RSA PRIVATE KEY-----
> > ++MIIG5AIBAAKCAYEAr9ccqtXp9bjGw2cHCkfxnX5mrt4YpbJ0H7PE0zQ0VgaSotkJ
> > ++72iI7GAv9rk68ljudDA8MBr81O2+xDMR3cjdvwDdu+OG0zuNDiKxtEk23EiYcbhS
> > ++N7NM50etj9sMTk0dqnqt8HOFxchzLMt9Wkni5QyIPH16wQ7Wp02ayQ35EpkFoX1K
> > ++CHIQ/Hi20EseuWlILBGm7recUOWxbz8lT3VxUosvFxargW1uygcnveqYBZMpcw64
> > ++wzznHWHdSsOTtiVuB6wdEk8CANHD4FpMG8fx7S/IPlcZnP5ZCLEAh+J/vZfSwkIU
> > ++YZxxR8j778o5vCVnYqaCNTH34jTWjq56DZ+vEN0V6VI3gMfVrlgJStUlqQY7TDP5
> > ++XhAG2i6xLTdDaJSVwfICPkBzU8XrPkyhxIz/gaEJANFIIOuAGvTxpZbEuc6aUx/P
> > ++ilTZ/9ckJYtu7CAQjfb9/XbUrgO6fqWY3LDkooCElYcob01/JWzoXl61Z5sdrMH5
> > ++CVZJty5foHKusAN5AgMBAAECggGAJRfqyzr+9L/65gOY35lXpdKhVKgzaNjhWEKy
> > ++9Z7gn3kZe9LvHprdr4eG9rQSdEdAXjBCsh8vULeqc3cWgMO7y2wiWl1f9rVsRxwY
> > ++gqCjOwrxZaPtbCSdx3g+a8dYrDfmVy0z/jJQeO2VJlDy65YEkC75mlEaERnRPE/J
> > ++pDoXXc37+xoUAP4XCTtpzTzbiV9lQy6iGV+QURxzNrWKaF2s/y2vTF6S5WWxZlrm
> > ++DlErqplluAjV/xGc63zWksv5IAZ6+s2An2a+cG2iaBCseQ2xVslI5v5YG8mEkVf0
> > ++2kk/OmSwxuEZ4DGxB/hDbOKRYLRYuPnxCV/esZJjOE/1OHVXvE8QtANN6EFwO60s
> > ++HnacI4U+tjCjbRBh3UbipruvdDqX8LMsNvUMGjci3vOjlNkcLgeL8J15Xs3l5WuC
> > ++Avl0Am91/FbpoN1qiPLny3jvEpjMbGUgfKRb03GIgHtPzbHmDdjluFZI+376i2/d
> > ++RI85dBqNmAn+Fjrz3kW6wkpahByBAoHBAOSj2DDXPosxxoLidP/J/RKsMT0t0FE9
> > ++UFcNt+tHYv6hk+e7VAuUqUpd3XQqz3P13rnK4xvSOsVguyeU/WgmH4ID9XGSgpBP
> > ++Rh6s7izn4KAJeqfI26vTPxvyaZEqB4JxT6k7SerENus95zSn1v/f2MLBQ16EP8cJ
> > +++QSOVCoZfEhUK+srherQ9eZKpj0OwBUrP4VhLdymv96r8xddWX1AVj4OBi2RywKI
> > ++gAgv6fjwkb292jFu6x6FjKRNKwKK6c3jqQKBwQDE4c0Oz0KYYV4feJun3iL9UJSv
> > ++StGsKVDuljA4WiBAmigMZTii/u0DFEjibiLWcJOnH53HTr0avA6c6D1nCwJ2qxyF
> > ++rHNN2L+cdMx/7L1zLR11+InvRgpIGbpeGwHeIzJVUYG3b6llRJMZimBvAMr9ipM1
> > ++bkVvIjt1G9W1ypeuKzm6d/t8F0yC7AIYZWDV4nvxiiY8whLZzGawHR2iZz8pfUwb
> > ++7URbTvxdsGE27Kq9gstU0PzEJpnU1goCJ7/gA1ECgcBA8w5B6ZM5xV0H5z6nPwDm
> > ++IgYmw/HucgV1hU8exfuoK8wxQvTACW4B0yJKkrK11T1899aGG7VYRn9D4j4OLO48
> > ++Z9V8esseJXbc1fEezovvymGOci984xiFXtqAQzk44+lmQJJh33VeZApe2eLocvVH
> > ++ddEmc1kOuJWFpszf3LeCcG69cnKrXsrLrZ8Frz//g3aa9B0sFi5hGeWHWJxISVN2
> > ++c1Nr9IN/57i/GqVTcztjdCAcdM7Tr8phDg7OvRlnxGkCgcEAuYhMFBuulyiSaTff
> > ++/3ZvJKYOJ45rPkEFGoD/2ercn+RlvyCYGcoAEjnIYVEGlWwrSH+b0NlbjVkQsD6O
> > ++to8CeE/RpgqX8hFCqC7NE/RFp8cpDyXy3j/zqnRMUyhCP1KNuScBBZs9V8gikxv6
> > ++ukBWCk3PYbeTySHKRBbB8vmCrMfhM96jaBIQsQO1CcZnVceDo1/bnsAIwaREVMxr
> > ++Q8LmG7QOx/Z0x1MMsUFoqzilwccC09/JgxMZPh+h+Nv6jiCxAoHBAOEqQgFAfSdR
> > ++ya60LLH55q803NRFMamuKiPbVJLzwiKfbjOiiopmQOS/LxxqIzeMXlYV4OsSvxTo
> > ++G7mcTOFRtU5hKCK+t8qeQQpa/dsMpiHllwArnRyBjIVgL5lFKRpHUGLsavU/T1IH
> > ++mtgaxZo32dXvcAh1+ndCHVBwbHTOF4conA+g+Usp4bZSSWn5nU4oIizvSVpG7SGe
> > ++0GngdxH9Usdqbvzcip1EKeHRTZrHIEYmB+x0LaRIB3dwZNidK3TkKw=3D=3D
> > ++-----END RSA PRIVATE KEY-----
> > ++
> > ++PublicKey =3D RSA-3072-PUBLIC
> > ++-----BEGIN PUBLIC KEY-----
> > ++MIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAr9ccqtXp9bjGw2cHCkfx
> > ++nX5mrt4YpbJ0H7PE0zQ0VgaSotkJ72iI7GAv9rk68ljudDA8MBr81O2+xDMR3cjd
> > ++vwDdu+OG0zuNDiKxtEk23EiYcbhSN7NM50etj9sMTk0dqnqt8HOFxchzLMt9Wkni
> > ++5QyIPH16wQ7Wp02ayQ35EpkFoX1KCHIQ/Hi20EseuWlILBGm7recUOWxbz8lT3Vx
> > ++UosvFxargW1uygcnveqYBZMpcw64wzznHWHdSsOTtiVuB6wdEk8CANHD4FpMG8fx
> > ++7S/IPlcZnP5ZCLEAh+J/vZfSwkIUYZxxR8j778o5vCVnYqaCNTH34jTWjq56DZ+v
> > ++EN0V6VI3gMfVrlgJStUlqQY7TDP5XhAG2i6xLTdDaJSVwfICPkBzU8XrPkyhxIz/
> > ++gaEJANFIIOuAGvTxpZbEuc6aUx/PilTZ/9ckJYtu7CAQjfb9/XbUrgO6fqWY3LDk
> > ++ooCElYcob01/JWzoXl61Z5sdrMH5CVZJty5foHKusAN5AgMBAAE=3D
> > ++-----END PUBLIC KEY-----
> > ++
> > ++PrivPubKeyPair =3D RSA-3072:RSA-3072-PUBLIC
> > ++
> > ++Availablein =3D default
> > ++# a random invalid ciphertext that generates an empty synthethic one
> > ++Decrypt =3D RSA-3072
> > ++Input =3D
> 5e956cd9652f4a2ece902931013e09662b6a9257ad1e987fb75f73a0606df2a4b04789770=
820c2e02322c4e826f767bd895734a01e20609c3be4517a7a2a589ea1cdc137beb73eb38dac=
781b52e863de9620f79f9b90fd5b953651fcbfef4a9f1cc07421d511a87dd6942caab6a5a0f=
4df473e62defb529a7de1509ab99c596e1dff1320402298d8be73a896cc86c38ae3f2f576e9=
ea70cc28ad575cb0f854f0be43186baa9c18e29c47c6ca77135db79c811231b7c1730955887=
d321fdc06568382b86643cf089b10e35ab23e827d2e5aa7b4e99ff2e914f302351819eb4d16=
93243b35f8bf1d42d08f8ec4acafa35f747a4a975a28643ec630d8e4fa5be59d81995660a14=
bb64c1fea5146d6b11f92da6a3956dd5cb5e0d747cf2ea23f81617769185336263d46ef4c14=
4b754de62a6337342d6c85a95f19f015724546ee3fc4823eca603dbc1dc01c2d5ed50bd72d8=
e96df2dc048edde0081284068283fc5e73a6139851abf2f29977d0b3d160c883a42a37efba1=
be05c1a0b1741d7ddf59
> > ++Output =3D
> > ++
> > ++Availablein =3D default
> > ++# a random invalid that has PRF output with a length one byte too lon=
g
> > ++# in the last value
> > ++Decrypt =3D RSA-3072
> > ++Input =3D
> 7db0390d75fcf9d4c59cf27b264190d856da9abd11e92334d0e5f71005cfed865a711dfa2=
8b791188374b61916dbc11339bf14b06f5f3f68c206c5607380e13da3129bfb744157e1527d=
d6fdf6651248b028a496ae1b97702d44706043cdaa7a59c0f41367303f21f268968bf3bd290=
4db3ae5239b55f8b438d93d7db9d1666c071c0857e2ec37757463769c54e51f052b2a71b04c=
2869e9e7049a1037b8429206c99726f07289bac18363e7eb2a5b417f47c37a55090cda67651=
7b3549c873f2fe95da9681752ec9864b069089a2ed2f340c8b04ee00079055a817a3355b46a=
c7dc00d17f4504ccfbcfcadb0c04cb6b22069e179385ae1eafabad5521bac2b8a8ee1dfff59=
a22eb3fdacfc87175d10d7894cfd869d056057dd9944b869c1784fcc27f731bc46171d39570=
fbffbadf082d33f6352ecf44aca8d9478e53f5a5b7c852b401e8f5f74da49da91e65bdc9776=
5a9523b7a0885a6f8afe5759d58009fbfa837472a968e6ae92026a5e0202a395483095302d6=
c3985b5f5831c521a271
> > ++Output =3D 56a3bea054e01338be9b7d7957539c
> > ++
> > ++Availablein =3D default
> > ++# a random invalid that generates a synthethic of maximum size
> > ++Decrypt =3D RSA-3072
> > ++Input =3D
> 1715065322522dff85049800f6a29ab5f98c465020467414b2a44127fe9446da47fa18047=
900f99afe67c2df6f50160bb8e90bff296610fde632b3859d4d0d2e644f23835028c46cca01=
b84b88231d7e03154edec6627bcba23de76740d839851fa12d74c8f92e540c73fe837b91b7d=
699b311997d5f0f7864c486d499c3a79c111faaacbe4799597a25066c6200215c3d158f3817=
c1aa57f18bdaad0be1658da9da93f5cc6c3c4dd72788af57adbb6a0c26f42d32d95b8a4f95e=
8c6feb2f8a5d53b19a50a0b7cbc25e055ad03e5ace8f3f7db13e57759f67b65d143f08cca15=
992c6b2aae643390483de111c2988d4e76b42596266005103c8de6044fb7398eb3c28a864fa=
672de5fd8774510ff45e05969a11a4c7d3f343e331190d2dcf24fb9154ba904dc94af98afc5=
774a9617d0418fe6d13f8245c7d7626c176138dd698a23547c25f27c2b98ea4d8a45c7842b8=
1888e4cc14e5b72e9cf91f56956c93dbf2e5f44a8282a7813157fc481ff1371a0f66b31797e=
81ebdb09a673d4db96d6
> > ++Output =3D
> 7b036fcd6243900e4236c894e2462c17738acc87e01a76f4d95cb9a328d9acde81650283b=
8e8f60a217e3bdee835c7b222ad4c85d0acdb9a309bd2a754609a65dec50f3aa04c6d589103=
4566b9563d42668ede1f8992b17753a2132e28970584e255efc8b45a41c5dbd7567f014acec=
5fe6fdb6d484790360a913ebb9defcd74ff377f2a8ba46d2ed85f733c9a3da08eb57ecedfaf=
da806778f03c66b2c5d2874cec1c291b2d49eb194c7b5d0dd2908ae90f4843268a2c4556309=
2ade08acb6ab481a08176102fc803fbb2f8ad11b0e1531bd37df543498daf180b12017f4d4d=
426ca29b4161075534bfb914968088a9d13785d0adc0e2580d3548494b2a9e91605f2b27e6c=
c701c796f0de7c6f471f6ab6cb9272a1ed637ca32a60d117505d82af3c1336104afb537d01a=
8f70b510e1eebf4869cb976c419473795a66c7f5e6e20a8094b1bb603a74330c537c5c0698c=
31538bd2e138c1275a1bdf24c5fa8ab3b7b526324e7918a382d1363b3d463764222150e04
> > ++
> > ++# a positive test case that decrypts to 9 byte long value
> > ++Availablein =3D default
> > ++Decrypt =3D RSA-3072
> > ++Input =3D
> 6c60845a854b4571f678941ae35a2ac03f67c21e21146f9db1f2306be9f136453b86ad556=
47d4f7b5c9e62197aaff0c0e40a3b54c4cde14e774b1c5959b6c2a2302896ffae1f73b00b86=
2a20ff4304fe06cea7ff30ecb3773ca9af27a0b54547350d7c07dfb0a39629c7e71e83fc5af=
9b2adbaf898e037f1de696a3f328cf45af7ec9aff7173854087fb8fbf34be981efbd8493f94=
38d1b2ba2a86af082662aa46ae9adfbec51e5f3d9550a4dd1dcb7c8969c9587a6edc82a8cab=
bc785c40d9fbd12064559fb769450ac3e47e87bc046148130d7eaa843e4b3ccef3675d06305=
00803cb7ffee3882378c1a404e850c3e20707bb745e42b13c18786c4976076ed9fa8fd0ff15=
e571bef02cbbe2f90c908ac3734a433b73e778d4d17fcc28f49185ebc6e8536a06d293202d9=
4496453bfdf1c2c7833a3f99fa38ca8a81f42eaa529d603b890308a319c0ab63a35ff8ebac9=
65f6278f5a7e5d622be5d5fe55f0ca3ec993d55430d2bf59c5d3e860e90c16d91a04596f6fd=
f60d89ed95d88c036dde
> > ++Output =3D "forty two"
> > ++
> > ++# a positive test case with null padded ciphertext
> > ++Availablein =3D default
> > ++Decrypt =3D RSA-3072
> > ++Inpu

--00000000000040bb49063aaf1d69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;d rather add a new openssl version that contain=
s the needed fix to meta-ltx-mixins than take this. Ruby&#39;s use in embed=
ded is marginal.<br></div><div><br></div><div>In any case, I would ask addi=
tional questions:</div><div><br></div><div>- how was the patch created? Was=
 it taken from Ubuntu? Was it modified to fit the openssl version in kirkst=
one, and if so, how? How can someone independently re-create the patch?<br>=
</div><div><br></div><div>- does the patch add a new feature to openssl? It=
 seems invasive enough that it does.</div><div><br></div><div>Referencing U=
buntu as upstream is not correct: they&#39;re not upstream for openssl.</di=
v><div><br></div><div>
&quot;Upstream-Status: Inappropriate [can&#39;t apply the exact patch]&quot=
; is also not correct, as the patch is a backport, and it isn&#39;t clear w=
here it needs to be &#39;applied&#39; and why.<br></div><div><br></div><div=
 dir=3D"auto">Alex</div></div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed 23. Jul 2025 at 18.38, Steve Sakoman &=
lt;<a href=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
The shortlog makes this a bit confusing, since it references ruby for<br>
the CVE, but only makes changes to the openssl recipe!<br>
<br>
Adding Alex since he is listed as maintainer for openssl.<br>
<br>
Steve<br>
<br>
<br>
On Wed, Jul 23, 2025 at 12:17=E2=80=AFAM dchellam via <a href=3D"http://lis=
ts.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedde=
d.org</a><br>
&lt;Divya.Chellam=3D<a href=3D"mailto:windriver.com@lists.openembedded.org"=
 target=3D"_blank">windriver.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Divya Chellam &lt;<a href=3D"mailto:divya.chellam@windriver.com"=
 target=3D"_blank">divya.chellam@windriver.com</a>&gt;<br>
&gt;<br>
&gt; A vulnerability was found in Ruby. The Ruby interpreter is vulnerable<=
br>
&gt; to the Marvin Attack. This attack allows the attacker to decrypt<br>
&gt; previously encrypted messages or forge signatures by exchanging a<br>
&gt; large number of messages with the vulnerable service.<br>
&gt;<br>
&gt; The issue can be workarounded by using Ruby with OpenSSL that implemen=
ts<br>
&gt; implicit rejection enabled in OpenSSL from 3.2.x.<br>
&gt;<br>
&gt; References:<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2025-0306" rel=3D"nore=
ferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2025-0306</a=
><br>
&gt; <a href=3D"https://ubuntu.com/security/CVE-2025-0306" rel=3D"noreferre=
r" target=3D"_blank">https://ubuntu.com/security/CVE-2025-0306</a><br>
&gt; <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D2336100" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?=
id=3D2336100</a><br>
&gt; <a href=3D"https://github.com/openssl/openssl/commit/7fc67e0a33102aa47=
bbaa56533eeecb98c0450f7" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/openssl/openssl/commit/7fc67e0a33102aa47bbaa56533eeecb98c0450f7</a><b=
r>
&gt; <a href=3D"https://github.com/openssl/openssl/commit/056dade341d258997=
5a3aae71f81c8d7061583c7" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/openssl/openssl/commit/056dade341d2589975a3aae71f81c8d7061583c7</a><b=
r>
&gt; <a href=3D"https://github.com/openssl/openssl/commit/8ae4f0e68ebb7435b=
e494b58676827ae91695371" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/openssl/openssl/commit/8ae4f0e68ebb7435be494b58676827ae91695371</a><b=
r>
&gt; <a href=3D"https://github.com/openssl/openssl/commit/5ab3ec1bb1eaa795d=
775f5896818cfaa84d33a1a" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/openssl/openssl/commit/5ab3ec1bb1eaa795d775f5896818cfaa84d33a1a</a><b=
r>
&gt; <a href=3D"https://github.com/openssl/openssl/commit/455db0c94c0b83083=
ce8b792982c03aa56fc866f" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/openssl/openssl/commit/455db0c94c0b83083ce8b792982c03aa56fc866f</a><b=
r>
&gt;<br>
&gt; Upstream-patch:<br>
&gt; <a href=3D"https://git.launchpad.net/ubuntu/+source/openssl/commit/?id=
=3D94ef7be2ab8e3313016ee77faf592f8af6255f8e" rel=3D"noreferrer" target=3D"_=
blank">https://git.launchpad.net/ubuntu/+source/openssl/commit/?id=3D94ef7b=
e2ab8e3313016ee77faf592f8af6255f8e</a><br>
&gt;<br>
&gt; Signed-off-by: Divya Chellam &lt;<a href=3D"mailto:divya.chellam@windr=
iver.com" target=3D"_blank">divya.chellam@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../openssl/openssl/CVE-2025-0306.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 1391 +++++++++++++++++<br>
&gt;=C2=A0 .../openssl/<a href=3D"http://openssl_3.0.17.bb" rel=3D"noreferr=
er" target=3D"_blank">openssl_3.0.17.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 1392 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE=
-2025-0306.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2025-0306.p=
atch b/meta/recipes-connectivity/openssl/openssl/CVE-2025-0306.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a5d93b7637<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2025-0306.patch<br=
>
&gt; @@ -0,0 +1,1391 @@<br>
&gt; +From 94ef7be2ab8e3313016ee77faf592f8af6255f8e Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Marc Deslauriers &lt;<a href=3D"mailto:marc.deslauriers@ubuntu.=
com" target=3D"_blank">marc.deslauriers@ubuntu.com</a>&gt;<br>
&gt; +Date: Wed, 5 Feb 2025 08:17:43 -0500<br>
&gt; +Subject: [PATCH] rsa: Add option to disable implicit rejection<br>
&gt; +<br>
&gt; +Gbp-Pq: openssl-pkcs1-implicit-rejection.patch.<br>
&gt; +<br>
&gt; +Source: <a href=3D"https://git.launchpad.net/ubuntu/+source/openssl/c=
ommit/?id=3D94ef7be2ab8e3313016ee77faf592f8af6255f8e" rel=3D"noreferrer" ta=
rget=3D"_blank">https://git.launchpad.net/ubuntu/+source/openssl/commit/?id=
=3D94ef7be2ab8e3313016ee77faf592f8af6255f8e</a><br>
&gt; +<br>
&gt; +CVE: CVE-2025-0306<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [can&#39;t apply the exact patch]<br>
&gt; +<br>
&gt; +Signed-off-by: Divya Chellam &lt;<a href=3D"mailto:divya.chellam@wind=
river.com" target=3D"_blank">divya.chellam@windriver.com</a>&gt;<br>
&gt; +---<br>
&gt; + crypto/cms/cms_env.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
&gt; + crypto/evp/ctrl_params_translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A06 +<br>
&gt; + crypto/pkcs7/pk7_doit.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +<br>
&gt; + crypto/rsa/rsa_ossl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 101 +++-<br>
&gt; + crypto/rsa/rsa_pk1.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 252 ++++++++++<br>
&gt; + crypto/rsa/rsa_pmeth.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 20 +-<br>
&gt; + doc/man1/<a href=3D"http://openssl-pkeyutl.pod.in" rel=3D"noreferrer=
" target=3D"_blank">openssl-pkeyutl.pod.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 15 +<br>
&gt; + doc/man1/<a href=3D"http://openssl-rsautl.pod.in" rel=3D"noreferrer"=
 target=3D"_blank">openssl-rsautl.pod.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +<br>
&gt; + doc/man3/EVP_PKEY_CTX_ctrl.pod=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +<br>
&gt; + doc/man3/EVP_PKEY_decrypt.pod=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +<br>
&gt; + doc/man3/RSA_padding_add_PKCS1_type_1.pod=C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A07 +-<br>
&gt; + doc/man3/RSA_public_encrypt.pod=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +-<br>
&gt; + doc/man7/provider-asym_cipher.pod=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A09 +<br>
&gt; + include/crypto/rsa.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
&gt; + include/openssl/core_names.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt; + include/openssl/rsa.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
&gt; + .../implementations/asymciphers/rsa_enc.c=C2=A0 =C2=A0 =C2=A0|=C2=A0=
 26 +-<br>
&gt; + .../30-test_evp_data/evppkey_rsa_common.txt=C2=A0 =C2=A0| 470 ++++++=
++++++++++++<br>
&gt; + 18 files changed, 960 insertions(+), 8 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/crypto/cms/cms_env.c b/crypto/cms/cms_env.c<br>
&gt; +index 445a16f..49b0289 100644<br>
&gt; +--- a/crypto/cms/cms_env.c<br>
&gt; ++++ b/crypto/cms/cms_env.c<br>
&gt; +@@ -581,6 +581,13 @@ static int cms_RecipientInfo_ktri_decrypt(CMS_Co=
ntentInfo *cms,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!ossl_cms_env_asn1_ctrl(ri, 1))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err;<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 if (EVP_PKEY_is_a(pkey, &quot;RSA&quot;))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* upper layer CMS code incorrectly assu=
mes that a successful RSA<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* decryption means that the key ma=
tches ciphertext (which never<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* was the case, implicit rejection=
 or not), so to make it work<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* disable implicit rejection for R=
SA keys */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 EVP_PKEY_CTX_ctrl_str(ktri-&gt;pctx, &qu=
ot;rsa_pkcs1_implicit_rejection&quot;, &quot;0&quot;);<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (EVP_PKEY_decrypt(ktri-&gt;pctx, NULL, &amp;ek=
len,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ktri-&gt;encryptedKey-&gt;data,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ktri-&gt;encryptedKey-&gt;length) &lt;=3D 0)<br>
&gt; +diff --git a/crypto/evp/ctrl_params_translate.c b/crypto/evp/ctrl_par=
ams_translate.c<br>
&gt; +index cbf02dc..369dc1a 100644<br>
&gt; +--- a/crypto/evp/ctrl_params_translate.c<br>
&gt; ++++ b/crypto/evp/ctrl_params_translate.c<br>
&gt; +@@ -2269,6 +2269,12 @@ static const struct translation_st evp_pkey_ct=
x_translations[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0EVP_PKEY_CTRL_GET_RSA_OAEP_LABEL, NULL, NU=
LL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL, OSSL_PA=
RAM_OCTET_PTR, NULL },<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 { SET, EVP_PKEY_RSA, 0, EVP_PKEY_OP_TYPE_CRYPT,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 EVP_PKEY_CTRL_RSA_IMPLICIT_REJECTION, NULL,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;rsa_pkcs1_implicit_rejection&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION, OSSL=
_PARAM_UNSIGNED_INTEGER,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 NULL },<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ SET, EVP_PKEY_RSA_PSS, 0, EVP_PKEY_OP_TYPE_GEN,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0EVP_PKEY_CTRL_MD, &quot;rsa_pss_keygen_md&=
quot;, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0OSSL_ALG_PARAM_DIGEST, OSSL_PARAM_UTF8_STR=
ING, fix_md },<br>
&gt; +diff --git a/crypto/pkcs7/pk7_doit.c b/crypto/pkcs7/pk7_doit.c<br>
&gt; +index e9de097..6d3124d 100644<br>
&gt; +--- a/crypto/pkcs7/pk7_doit.c<br>
&gt; ++++ b/crypto/pkcs7/pk7_doit.c<br>
&gt; +@@ -170,6 +170,13 @@ static int pkcs7_decrypt_rinfo(unsigned char **p=
ek, int *peklen,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (EVP_PKEY_decrypt_init(pctx) &lt;=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err;<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 if (EVP_PKEY_is_a(pkey, &quot;RSA&quot;))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* upper layer pkcs7 code incorrectly as=
sumes that a successful RSA<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* decryption means that the key ma=
tches ciphertext (which never<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* was the case, implicit rejection=
 or not), so to make it work<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* disable implicit rejection for R=
SA keys */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 EVP_PKEY_CTX_ctrl_str(pctx, &quot;rsa_pk=
cs1_implicit_rejection&quot;, &quot;0&quot;);<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (EVP_PKEY_decrypt(pctx, NULL, &amp;eklen,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ri-&gt;enc_key-&gt;data, ri-&gt;enc_key-&gt;length) &=
lt;=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err;<br>
&gt; +diff --git a/crypto/rsa/rsa_ossl.c b/crypto/rsa/rsa_ossl.c<br>
&gt; +index 0fc642e..e5591cb 100644<br>
&gt; +--- a/crypto/rsa/rsa_ossl.c<br>
&gt; ++++ b/crypto/rsa/rsa_ossl.c<br>
&gt; +@@ -17,6 +17,9 @@<br>
&gt; + #include &quot;crypto/bn.h&quot;<br>
&gt; + #include &quot;rsa_local.h&quot;<br>
&gt; + #include &quot;internal/constant_time.h&quot;<br>
&gt; ++#include &lt;openssl/evp.h&gt;<br>
&gt; ++#include &lt;openssl/sha.h&gt;<br>
&gt; ++#include &lt;openssl/hmac.h&gt;<br>
&gt; +<br>
&gt; + static int rsa_ossl_public_encrypt(int flen, const unsigned char *fr=
om,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char *to, =
RSA *rsa, int padding);<br>
&gt; +@@ -377,8 +380,13 @@ static int rsa_ossl_private_decrypt(int flen, co=
nst unsigned char *from,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0BIGNUM *f, *ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int j, num =3D 0, r =3D -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned char *buf =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 unsigned char d_hash[SHA256_DIGEST_LENGTH] =3D {0};<br=
>
&gt; ++=C2=A0 =C2=A0 HMAC_CTX *hmac =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 unsigned int md_len =3D SHA256_DIGEST_LENGTH;<br>
&gt; ++=C2=A0 =C2=A0 unsigned char kdk[SHA256_DIGEST_LENGTH] =3D {0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0BN_CTX *ctx =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int local_blinding =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 EVP_MD *md =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Used only if the blinding structure is shared.=
 A non-NULL unblind<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * instructs rsa_blinding_convert() and rsa_blind=
ing_invert() to store<br>
&gt; +@@ -387,6 +395,12 @@ static int rsa_ossl_private_decrypt(int flen, co=
nst unsigned char *from,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0BIGNUM *unblind =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0BN_BLINDING *blinding =3D NULL;<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* we need the value of the private exponent to p=
erform implicit rejection<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 if ((rsa-&gt;flags &amp; RSA_FLAG_EXT_PKEY) &amp;&amp;=
 (padding =3D=3D RSA_PKCS1_PADDING))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 padding =3D RSA_PKCS1_NO_IMPLICIT_REJECT=
_PADDING;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((ctx =3D BN_CTX_new_ex(rsa-&gt;libctx)) =3D=
=3D NULL)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0BN_CTX_start(ctx);<br>
&gt; +@@ -408,6 +422,11 @@ static int rsa_ossl_private_decrypt(int flen, co=
nst unsigned char *from,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 if (flen &lt; 1) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, RSA_R_DATA_TOO_SM=
ALL);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* make data into a big number */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (BN_bin2bn(from, (int)flen, f) =3D=3D NULL)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err;<br>
&gt; +@@ -468,6 +487,81 @@ static int rsa_ossl_private_decrypt(int flen, co=
nst unsigned char *from,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BN_free(d);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* derive the Key Derivation Key from private exp=
onent and public<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* ciphertext<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 if (padding =3D=3D RSA_PKCS1_PADDING) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* because we use d as a handle to =
rsa-&gt;d we need to keep it local and<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* free before any further use of r=
sa-&gt;d<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 BIGNUM *d =3D BN_new();<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (d =3D=3D NULL) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, ERR=
_R_MALLOC_FAILURE);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rsa-&gt;d =3D=3D NULL) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, RSA=
_R_MISSING_PRIVATE_KEY);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BN_free(d);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 BN_with_flags(d, rsa-&gt;d, BN_FLG_CONST=
TIME);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (BN_bn2binpad(d, buf, num) &lt; 0) {<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, ERR=
_R_INTERNAL_ERROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BN_free(d);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 BN_free(d);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we use hardcoded hash so that mi=
grating between versions that use<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* different hash doesn&#39;t provi=
de a Bleichenbacher oracle:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* if the attacker can see that dif=
ferent versions return different<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* messages for the same ciphertext=
, they&#39;ll know that the message is<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* syntethically generated, which m=
eans that the padding check failed<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 md =3D EVP_MD_fetch(rsa-&gt;libctx, &quo=
t;sha256&quot;, NULL);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (md =3D=3D NULL) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, ERR=
_R_INTERNAL_ERROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (EVP_Digest(buf, num, d_hash, NULL, m=
d, NULL) &lt;=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, ERR=
_R_INTERNAL_ERROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 hmac =3D HMAC_CTX_new();<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hmac =3D=3D NULL) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, ERR=
_R_MALLOC_FAILURE);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (HMAC_Init_ex(hmac, d_hash, sizeof(d_=
hash), md, NULL) &lt;=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, ERR=
_R_INTERNAL_ERROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (flen &lt; num) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(buf, 0, num - flen)=
;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (HMAC_Update(hmac, buf,=
 num - flen) &lt;=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ER=
R_LIB_RSA, ERR_R_INTERNAL_ERROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (HMAC_Update(hmac, from, flen) &lt;=
=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, ERR=
_R_INTERNAL_ERROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 md_len =3D SHA256_DIGEST_LENGTH;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (HMAC_Final(hmac, kdk, &amp;md_len) &=
lt;=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, ERR=
_R_INTERNAL_ERROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (blinding)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!rsa_blinding_invert(blinding, =
ret, unblind, ctx))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err;<br>
&gt; +@@ -477,9 +571,12 @@ static int rsa_ossl_private_decrypt(int flen, co=
nst unsigned char *from,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (padding) {<br>
&gt; +-=C2=A0 =C2=A0 case RSA_PKCS1_PADDING:<br>
&gt; ++=C2=A0 =C2=A0 case RSA_PKCS1_NO_IMPLICIT_REJECT_PADDING:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D RSA_padding_check_PKCS1_type_=
2(to, num, buf, j, num);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; ++=C2=A0 =C2=A0 case RSA_PKCS1_PADDING:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D ossl_rsa_padding_check_PKCS1_type_=
2(rsa-&gt;libctx, to, num, buf, j, num, kdk);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case RSA_PKCS1_OAEP_PADDING:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D RSA_padding_check_PKCS1_OAEP(=
to, num, buf, j, num, NULL, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +@@ -501,6 +598,8 @@ static int rsa_ossl_private_decrypt(int flen, con=
st unsigned char *from,<br>
&gt; + #endif<br>
&gt; +<br>
&gt; +=C2=A0 err:<br>
&gt; ++=C2=A0 =C2=A0 HMAC_CTX_free(hmac);<br>
&gt; ++=C2=A0 =C2=A0 EVP_MD_free(md);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0BN_CTX_end(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0BN_CTX_free(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0OPENSSL_clear_free(buf, num);<br>
&gt; +diff --git a/crypto/rsa/rsa_pk1.c b/crypto/rsa/rsa_pk1.c<br>
&gt; +index 51507fc..5cd2b26 100644<br>
&gt; +--- a/crypto/rsa/rsa_pk1.c<br>
&gt; ++++ b/crypto/rsa/rsa_pk1.c<br>
&gt; +@@ -21,10 +21,14 @@<br>
&gt; + #include &lt;openssl/rand.h&gt;<br>
&gt; + /* Just for the SSL_MAX_MASTER_KEY_LENGTH value */<br>
&gt; + #include &lt;openssl/prov_ssl.h&gt;<br>
&gt; ++#include &lt;openssl/evp.h&gt;<br>
&gt; ++#include &lt;openssl/sha.h&gt;<br>
&gt; ++#include &lt;openssl/hmac.h&gt;<br>
&gt; + #include &quot;internal/cryptlib.h&quot;<br>
&gt; + #include &quot;crypto/rsa.h&quot;<br>
&gt; + #include &quot;rsa_local.h&quot;<br>
&gt; +<br>
&gt; ++<br>
&gt; + int RSA_padding_add_PKCS1_type_1(unsigned char *to, int tlen,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const unsigned char *from=
, int flen)<br>
&gt; + {<br>
&gt; +@@ -273,6 +277,254 @@ int RSA_padding_check_PKCS1_type_2(unsigned cha=
r *to, int tlen,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return constant_time_select_int(good, mlen, -1);<=
br>
&gt; + }<br>
&gt; +<br>
&gt; ++<br>
&gt; ++static int ossl_rsa_prf(OSSL_LIB_CTX *ctx,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 unsigned char *to, int tlen,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const char *label, int llen,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const unsigned char *kdk,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 uint16_t bitlen)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 int pos;<br>
&gt; ++=C2=A0 =C2=A0 int ret =3D -1;<br>
&gt; ++=C2=A0 =C2=A0 uint16_t iter =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 unsigned char be_iter[sizeof(iter)];<br>
&gt; ++=C2=A0 =C2=A0 unsigned char be_bitlen[sizeof(bitlen)];<br>
&gt; ++=C2=A0 =C2=A0 HMAC_CTX *hmac =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 EVP_MD *md =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 unsigned char hmac_out[SHA256_DIGEST_LENGTH];<br>
&gt; ++=C2=A0 =C2=A0 unsigned int md_len;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 if (tlen * 8 !=3D bitlen) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ER=
ROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 be_bitlen[0] =3D (bitlen &gt;&gt; 8) &amp; 0xff;<br>
&gt; ++=C2=A0 =C2=A0 be_bitlen[1] =3D bitlen &amp; 0xff;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 hmac =3D HMAC_CTX_new();<br>
&gt; ++=C2=A0 =C2=A0 if (hmac =3D=3D NULL) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ER=
ROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* we use hardcoded hash so that migrating betwee=
n versions that use<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* different hash doesn&#39;t provide a Bleichenb=
acher oracle:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* if the attacker can see that different version=
s return different<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* messages for the same ciphertext, they&#39;ll =
know that the message is<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* syntethically generated, which means that the =
padding check failed<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 md =3D EVP_MD_fetch(ctx, &quot;sha256&quot;, NULL);<br=
>
&gt; ++=C2=A0 =C2=A0 if (md =3D=3D NULL) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ER=
ROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 if (HMAC_Init_ex(hmac, kdk, SHA256_DIGEST_LENGTH, md, =
NULL) &lt;=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ER=
ROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 for (pos =3D 0; pos &lt; tlen; pos +=3D SHA256_DIGEST_=
LENGTH, iter++) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (HMAC_Init_ex(hmac, NULL, 0, NULL, NU=
LL) &lt;=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, ERR=
_R_INTERNAL_ERROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 be_iter[0] =3D (iter &gt;&gt; 8) &amp; 0=
xff;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 be_iter[1] =3D iter &amp; 0xff;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (HMAC_Update(hmac, be_iter, sizeof(be=
_iter)) &lt;=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, ERR=
_R_INTERNAL_ERROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (HMAC_Update(hmac, (unsigned char *)l=
abel, llen) &lt;=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, ERR=
_R_INTERNAL_ERROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (HMAC_Update(hmac, be_bitlen, sizeof(=
be_bitlen)) &lt;=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, ERR=
_R_INTERNAL_ERROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* HMAC_Final requires the output b=
uffer to fit the whole MAC<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* value, so we need to use the int=
ermediate buffer for the last<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* unaligned block<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 md_len =3D SHA256_DIGEST_LENGTH;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pos + SHA256_DIGEST_LENGTH &gt; tlen=
) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (HMAC_Final(hmac, hmac_=
out, &amp;md_len) &lt;=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ER=
R_LIB_RSA, ERR_R_INTERNAL_ERROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(to + pos, hmac_out,=
 tlen - pos);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (HMAC_Final(hmac, to + =
pos, &amp;md_len) &lt;=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ER=
R_LIB_RSA, ERR_R_INTERNAL_ERROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 ret =3D 0;<br>
&gt; ++<br>
&gt; ++err:<br>
&gt; ++=C2=A0 =C2=A0 HMAC_CTX_free(hmac);<br>
&gt; ++=C2=A0 =C2=A0 EVP_MD_free(md);<br>
&gt; ++=C2=A0 =C2=A0 return ret;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/*<br>
&gt; ++ * ossl_rsa_padding_check_PKCS1_type_2() checks and removes the PKCS=
#1 type 2<br>
&gt; ++ * padding from a decrypted RSA message. Unlike the<br>
&gt; ++ * RSA_padding_check_PKCS1_type_2() it will not return an error in c=
ase it<br>
&gt; ++ * detects a padding error, rather it will return a deterministicall=
y generated<br>
&gt; ++ * random message. In other words it will perform an implicit reject=
ion<br>
&gt; ++ * of an invalid padding. This means that the returned value does no=
t indicate<br>
&gt; ++ * if the padding of the encrypted message was correct or not, makin=
g<br>
&gt; ++ * side channel attacks like the ones described by Bleichenbacher im=
possible<br>
&gt; ++ * without access to the full decrypted value and a brute-force sear=
ch of<br>
&gt; ++ * remaining padding bytes<br>
&gt; ++ */<br>
&gt; ++int ossl_rsa_padding_check_PKCS1_type_2(OSSL_LIB_CTX *ctx,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
nsigned char *to, int tlen,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
onst unsigned char *from, int flen,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
nt num, unsigned char *kdk)<br>
&gt; ++{<br>
&gt; ++/*<br>
&gt; ++ * We need to generate a random length for the synthethic message, t=
o avoid<br>
&gt; ++ * bias towards zero and avoid non-constant timeness of DIV, we prep=
are<br>
&gt; ++ * 128 values to check if they are not too large for the used key si=
ze,<br>
&gt; ++ * and use 0 in case none of them are small enough, as 2^-128 is a g=
ood enough<br>
&gt; ++ * safety margin<br>
&gt; ++ */<br>
&gt; ++#define MAX_LEN_GEN_TRIES 128<br>
&gt; ++=C2=A0 =C2=A0 unsigned char *synthetic =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 int synthethic_length;<br>
&gt; ++=C2=A0 =C2=A0 uint16_t len_candidate;<br>
&gt; ++=C2=A0 =C2=A0 unsigned char candidate_lengths[MAX_LEN_GEN_TRIES * si=
zeof(len_candidate)];<br>
&gt; ++=C2=A0 =C2=A0 uint16_t len_mask;<br>
&gt; ++=C2=A0 =C2=A0 uint16_t max_sep_offset;<br>
&gt; ++=C2=A0 =C2=A0 int synth_msg_index =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 int ret =3D -1;<br>
&gt; ++=C2=A0 =C2=A0 int i, j;<br>
&gt; ++=C2=A0 =C2=A0 unsigned int good, found_zero_byte;<br>
&gt; ++=C2=A0 =C2=A0 int zero_index =3D 0, msg_index;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* If these checks fail then either the message i=
n publicly invalid, or<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* we&#39;ve been called incorrectly. We can fail=
 immediately.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* Since this code is called only internally by o=
penssl, those are just<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* sanity checks<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 if (num !=3D flen || tlen &lt;=3D 0 || flen &lt;=3D 0)=
 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ER=
ROR);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* Generate a random message to return in case the pad=
ding checks fail */<br>
&gt; ++=C2=A0 =C2=A0 synthetic =3D OPENSSL_malloc(flen);<br>
&gt; ++=C2=A0 =C2=A0 if (synthetic =3D=3D NULL) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, ERR_R_MALLOC_FAIL=
URE);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 if (ossl_rsa_prf(ctx, synthetic, flen, &quot;message&q=
uot;, 7, kdk, flen * 8) &lt; 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* decide how long the random message should be */<br>
&gt; ++=C2=A0 =C2=A0 if (ossl_rsa_prf(ctx, candidate_lengths, sizeof(candid=
ate_lengths),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;length&quot;, 6, kdk,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MAX_LEN_GEN_TRIES * sizeof(len_candidate) * 8) &lt; 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* max message size is the size of the modulus si=
ze less 2 bytes for<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* version and padding type and a minimum of 8 by=
tes padding<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 len_mask =3D max_sep_offset =3D flen - 2 - 8;<br>
&gt; ++=C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* we want a mask so lets propagate the high bit =
to all positions less<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* significant than it<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 len_mask |=3D len_mask &gt;&gt; 1;<br>
&gt; ++=C2=A0 =C2=A0 len_mask |=3D len_mask &gt;&gt; 2;<br>
&gt; ++=C2=A0 =C2=A0 len_mask |=3D len_mask &gt;&gt; 4;<br>
&gt; ++=C2=A0 =C2=A0 len_mask |=3D len_mask &gt;&gt; 8;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 synthethic_length =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 for (i =3D 0; i &lt; MAX_LEN_GEN_TRIES * (int)sizeof(l=
en_candidate);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i +=3D sizeof(len_candidat=
e)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 len_candidate =3D (candidate_lengths[i] =
&lt;&lt; 8) | candidate_lengths[i + 1];<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 len_candidate &amp;=3D len_mask;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 synthethic_length =3D constant_time_sele=
ct_int(<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 constant_time_lt(len_candi=
date, max_sep_offset),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len_candidate, synthethic_=
length);<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 synth_msg_index =3D flen - synthethic_length;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* we have alternative message ready, check the real o=
ne */<br>
&gt; ++=C2=A0 =C2=A0 good =3D constant_time_is_zero(from[0]);<br>
&gt; ++=C2=A0 =C2=A0 good &amp;=3D constant_time_eq(from[1], 2);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /* then look for the padding|message separator (the fi=
rst zero byte) */<br>
&gt; ++=C2=A0 =C2=A0 found_zero_byte =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 for (i =3D 2; i &lt; flen; i++) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int equals0 =3D constant_time_i=
s_zero(from[i]);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 zero_index =3D constant_time_select_int(=
~found_zero_byte &amp; equals0,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 i, zero_index);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 found_zero_byte |=3D equals0;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* padding must be at least 8 bytes long, and it =
starts two bytes into<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* |from|. If we never found a 0-byte, then |zero=
_index| is 0 and the check<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* also fails.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 good &amp;=3D constant_time_ge(zero_index, 2 + 8);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* Skip the zero byte. This is incorrect if we ne=
ver found a zero-byte<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* but in this case we also do not copy the messa=
ge out.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 msg_index =3D zero_index + 1;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* old code returned an error in case the decrypt=
ed message wouldn&#39;t fit<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* into the |to|, since that would leak informati=
on, return the synthethic<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* message instead<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 good &amp;=3D constant_time_ge(tlen, num - msg_index);=
<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 msg_index =3D constant_time_select_int(good, msg_index=
, synth_msg_index);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* since at this point the |msg_index| does not p=
rovide the signal<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* indicating if the padding check failed or not,=
 we don&#39;t have to worry<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* about leaking the length of returned message, =
we still need to ensure<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* that we read contents of both buffers so that =
cache accesses don&#39;t leak<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* the value of |good|<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 for (i =3D msg_index, j =3D 0; i &lt; flen &amp;&amp; =
j &lt; tlen; i++, j++)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 to[j] =3D constant_time_select_8(good, f=
rom[i], synthetic[i]);<br>
&gt; ++=C2=A0 =C2=A0 ret =3D j;<br>
&gt; ++<br>
&gt; ++err:<br>
&gt; ++=C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* the only time ret &lt; 0 is when the ciphertex=
t is publicly invalid<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* or we were called with invalid parameters, so =
we don&#39;t have to perform<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* a side-channel secure raising of the error<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 if (ret &lt; 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ER=
ROR);<br>
&gt; ++=C2=A0 =C2=A0 OPENSSL_free(synthetic);<br>
&gt; ++=C2=A0 =C2=A0 return ret;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + /*<br>
&gt; +=C2=A0 * ossl_rsa_padding_check_PKCS1_type_2_TLS() checks and removes=
 the PKCS1 type 2<br>
&gt; +=C2=A0 * padding from a decrypted RSA message in a TLS signature. The=
 result is stored<br>
&gt; +diff --git a/crypto/rsa/rsa_pmeth.c b/crypto/rsa/rsa_pmeth.c<br>
&gt; +index 0bf5ac0..81b031f 100644<br>
&gt; +--- a/crypto/rsa/rsa_pmeth.c<br>
&gt; ++++ b/crypto/rsa/rsa_pmeth.c<br>
&gt; +@@ -52,6 +52,8 @@ typedef struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* OAEP label */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned char *oaep_label;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t oaep_labellen;<br>
&gt; ++=C2=A0 =C2=A0 /* if to use implicit rejection in PKCS#1 v1.5 decrypt=
ion */<br>
&gt; ++=C2=A0 =C2=A0 int implicit_rejection;<br>
&gt; + } RSA_PKEY_CTX;<br>
&gt; +<br>
&gt; + /* True if PSS parameters are restricted */<br>
&gt; +@@ -72,6 +74,7 @@ static int pkey_rsa_init(EVP_PKEY_CTX *ctx)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Maximum for sign, auto for verify */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rctx-&gt;saltlen =3D RSA_PSS_SALTLEN_AUTO;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rctx-&gt;min_saltlen =3D -1;<br>
&gt; ++=C2=A0 =C2=A0 rctx-&gt;implicit_rejection =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;data =3D rctx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;keygen_info =3D rctx-&gt;gentmp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;keygen_info_count =3D 2;<br>
&gt; +@@ -97,6 +100,7 @@ static int pkey_rsa_copy(EVP_PKEY_CTX *dst, const =
EVP_PKEY_CTX *src)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dctx-&gt;md =3D sctx-&gt;md;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dctx-&gt;mgf1md =3D sctx-&gt;mgf1md;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dctx-&gt;saltlen =3D sctx-&gt;saltlen;<br>
&gt; ++=C2=A0 =C2=A0 dctx-&gt;implicit_rejection =3D sctx-&gt;implicit_reje=
ction;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (sctx-&gt;oaep_label) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPENSSL_free(dctx-&gt;oaep_label);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dctx-&gt;oaep_label =3D OPENSSL_mem=
dup(sctx-&gt;oaep_label, sctx-&gt;oaep_labellen);<br>
&gt; +@@ -347,6 +351,7 @@ static int pkey_rsa_decrypt(EVP_PKEY_CTX *ctx,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const unsigned char *in, size_t inlen)<b=
r>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; ++=C2=A0 =C2=A0 int pad_mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0RSA_PKEY_CTX *rctx =3D ctx-&gt;data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Discard const. Its marked as const because thi=
s may be a cached copy of<br>
&gt; +@@ -367,7 +372,12 @@ static int pkey_rsa_decrypt(EVP_PKEY_CTX *ctx,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rctx-&gt;oaep_labellen,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rctx-&gt;md, rctx-&gt;mgf1md);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D RSA_private_decrypt(inlen, in, o=
ut, rsa, rctx-&gt;pad_mode);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rctx-&gt;pad_mode =3D=3D RSA_PKCS1_P=
ADDING &amp;&amp;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rctx-&gt;implicit_r=
ejection =3D=3D 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pad_mode =3D RSA_PKCS1_NO_=
IMPLICIT_REJECT_PADDING;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pad_mode =3D rctx-&gt;pad_=
mode;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D RSA_private_decrypt(inlen, in, o=
ut, rsa, pad_mode);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*outlen =3D constant_time_select_s(constant_time_=
msb_s(ret), *outlen, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D constant_time_select_int(constant_time_ms=
b(ret), ret, 1);<br>
&gt; +@@ -591,6 +601,14 @@ static int pkey_rsa_ctrl(EVP_PKEY_CTX *ctx, int =
type, int p1, void *p2)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*(unsigned char **)p2 =3D rctx-&gt;=
oaep_label;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return rctx-&gt;oaep_labellen;<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 case EVP_PKEY_CTRL_RSA_IMPLICIT_REJECTION:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rctx-&gt;pad_mode !=3D RSA_PKCS1_PAD=
DING) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_raise(ERR_LIB_RSA, RSA=
_R_INVALID_PADDING_MODE);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -2;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 rctx-&gt;implicit_rejection =3D p1;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case EVP_PKEY_CTRL_DIGESTINIT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case EVP_PKEY_CTRL_PKCS7_SIGN:<br>
&gt; + #ifndef OPENSSL_NO_CMS<br>
&gt; +diff --git a/doc/man1/<a href=3D"http://openssl-pkeyutl.pod.in" rel=
=3D"noreferrer" target=3D"_blank">openssl-pkeyutl.pod.in</a> b/doc/man1/<a =
href=3D"http://openssl-pkeyutl.pod.in" rel=3D"noreferrer" target=3D"_blank"=
>openssl-pkeyutl.pod.in</a><br>
&gt; +index 2f6ef00..5e62551 100644<br>
&gt; +--- a/doc/man1/<a href=3D"http://openssl-pkeyutl.pod.in" rel=3D"noref=
errer" target=3D"_blank">openssl-pkeyutl.pod.in</a><br>
&gt; ++++ b/doc/man1/<a href=3D"http://openssl-pkeyutl.pod.in" rel=3D"noref=
errer" target=3D"_blank">openssl-pkeyutl.pod.in</a><br>
&gt; +@@ -273,6 +273,11 @@ signed or verified directly instead of using a B=
&lt;DigestInfo&gt; structure. If a<br>
&gt; + digest is set, then the B&lt;DigestInfo&gt; structure is used and it=
s length<br>
&gt; + must correspond to the digest type.<br>
&gt; +<br>
&gt; ++Note, for B&lt;pkcs1&gt; padding, as a protection against Bleichenba=
cher attack,<br>
&gt; ++the decryption will not fail in case of padding check failures. Use =
B&lt;none&gt;<br>
&gt; ++and manual inspection of the decrypted message to verify if the decr=
ypted<br>
&gt; ++value has correct PKCS#1 v1.5 padding.<br>
&gt; ++<br>
&gt; + For B&lt;oaep&gt; mode only encryption and decryption is supported.<=
br>
&gt; +<br>
&gt; + For B&lt;x931&gt; if the digest type is set it is used to format the=
 block data<br>
&gt; +@@ -300,6 +305,16 @@ explicitly set in PSS mode then the signing dige=
st is used.<br>
&gt; + Sets the digest used for the OAEP hash function. If not explicitly s=
et then<br>
&gt; + SHA1 is used.<br>
&gt; +<br>
&gt; ++=3Ditem B&lt;rsa_pkcs1_implicit_rejection:&gt;I&lt;flag&gt;<br>
&gt; ++<br>
&gt; ++Disables (when set to 0) or enables (when set to 1) the use of impli=
cit<br>
&gt; ++rejection with PKCS#1 v1.5 decryption. When enabled (the default), a=
s a<br>
&gt; ++protection against Bleichenbacher attack, the library will generate =
a<br>
&gt; ++deterministic random plaintext that it will return to the caller in =
case<br>
&gt; ++of padding check failure.<br>
&gt; ++When disabled, it&#39;s the callers&#39; responsibility to handle th=
e returned<br>
&gt; ++errors in a side-channel free manner.<br>
&gt; ++<br>
&gt; + =3Dback<br>
&gt; +<br>
&gt; + =3Dhead1 RSA-PSS ALGORITHM<br>
&gt; +diff --git a/doc/man1/<a href=3D"http://openssl-rsautl.pod.in" rel=3D=
"noreferrer" target=3D"_blank">openssl-rsautl.pod.in</a> b/doc/man1/<a href=
=3D"http://openssl-rsautl.pod.in" rel=3D"noreferrer" target=3D"_blank">open=
ssl-rsautl.pod.in</a><br>
&gt; +index 0a32fd9..4c462ab 100644<br>
&gt; +--- a/doc/man1/<a href=3D"http://openssl-rsautl.pod.in" rel=3D"norefe=
rrer" target=3D"_blank">openssl-rsautl.pod.in</a><br>
&gt; ++++ b/doc/man1/<a href=3D"http://openssl-rsautl.pod.in" rel=3D"norefe=
rrer" target=3D"_blank">openssl-rsautl.pod.in</a><br>
&gt; +@@ -105,6 +105,11 @@ The padding to use: PKCS#1 v1.5 (the default), P=
KCS#1 OAEP,<br>
&gt; + ANSI X9.31, or no padding, respectively.<br>
&gt; + For signatures, only B&lt;-pkcs&gt; and B&lt;-raw&gt; can be used.<b=
r>
&gt; +<br>
&gt; ++Note: because of protection against Bleichenbacher attacks, decrypti=
on<br>
&gt; ++using PKCS#1 v1.5 mode will not return errors in case padding check =
failed.<br>
&gt; ++Use B&lt;-raw&gt; and inspect the returned value manually to check i=
f the<br>
&gt; ++padding is correct.<br>
&gt; ++<br>
&gt; + =3Ditem B&lt;-hexdump&gt;<br>
&gt; +<br>
&gt; + Hex dump the output data.<br>
&gt; +diff --git a/doc/man3/EVP_PKEY_CTX_ctrl.pod b/doc/man3/EVP_PKEY_CTX_c=
trl.pod<br>
&gt; +index 3075eaa..3844aa2 100644<br>
&gt; +--- a/doc/man3/EVP_PKEY_CTX_ctrl.pod<br>
&gt; ++++ b/doc/man3/EVP_PKEY_CTX_ctrl.pod<br>
&gt; +@@ -386,6 +386,15 @@ this behaviour should be tolerated then<br>
&gt; + OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSION should be set to the a=
ctual<br>
&gt; + negotiated protocol version. Otherwise it should be left unset.<br>
&gt; +<br>
&gt; ++Similarly to the B&lt;RSA_PKCS1_WITH_TLS_PADDING&gt; above, since Op=
enSSL version<br>
&gt; ++3.1.0, the use of B&lt;RSA_PKCS1_PADDING&gt; will return a randomly =
generated message<br>
&gt; ++instead of padding errors in case padding checks fail. Applications =
that<br>
&gt; ++want to remain secure while using earlier versions of OpenSSL, still=
 need to<br>
&gt; ++handle both the error code from the RSA decryption operation and the=
<br>
&gt; ++returned message in a side channel secure manner.<br>
&gt; ++This protection against Bleichenbacher attacks can be disabled by se=
tting<br>
&gt; ++the OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION (an unsigned integer) =
to 0.<br>
&gt; ++<br>
&gt; + =3Dhead2 DSA parameters<br>
&gt; +<br>
&gt; + EVP_PKEY_CTX_set_dsa_paramgen_bits() sets the number of bits used fo=
r DSA<br>
&gt; +diff --git a/doc/man3/EVP_PKEY_decrypt.pod b/doc/man3/EVP_PKEY_decryp=
t.pod<br>
&gt; +index b6f9bad..898535a 100644<br>
&gt; +--- a/doc/man3/EVP_PKEY_decrypt.pod<br>
&gt; ++++ b/doc/man3/EVP_PKEY_decrypt.pod<br>
&gt; +@@ -51,6 +51,18 @@ return 1 for success and 0 or a negative value for=
 failure. In particular a<br>
&gt; + return value of -2 indicates the operation is not supported by the p=
ublic key<br>
&gt; + algorithm.<br>
&gt; +<br>
&gt; ++=3Dhead1 WARNINGS<br>
&gt; ++<br>
&gt; ++In OpenSSL versions before 3.1.0, when used in PKCS#1 v1.5 padding,<=
br>
&gt; ++both the return value from the EVP_PKEY_decrypt() and the B&lt;outle=
n&gt; provided<br>
&gt; ++information useful in mounting a Bleichenbacher attack against the<b=
r>
&gt; ++used private key. They had to processed in a side-channel free way.<=
br>
&gt; ++<br>
&gt; ++Since version 3.1.0, the EVP_PKEY_decrypt() method when used with PK=
CS#1<br>
&gt; ++v1.5 padding doesn&#39;t return an error in case it detects an error=
 in padding,<br>
&gt; ++instead it returns a pseudo-randomly generated message, removing the=
 need<br>
&gt; ++of side-channel secure code from applications using OpenSSL.<br>
&gt; ++<br>
&gt; + =3Dhead1 EXAMPLES<br>
&gt; +<br>
&gt; + Decrypt data using OAEP (for RSA keys):<br>
&gt; +diff --git a/doc/man3/RSA_padding_add_PKCS1_type_1.pod b/doc/man3/RSA=
_padding_add_PKCS1_type_1.pod<br>
&gt; +index 9f7025c..36ae185 100644<br>
&gt; +--- a/doc/man3/RSA_padding_add_PKCS1_type_1.pod<br>
&gt; ++++ b/doc/man3/RSA_padding_add_PKCS1_type_1.pod<br>
&gt; +@@ -121,8 +121,8 @@ L&lt;ERR_get_error(3)&gt;.<br>
&gt; +<br>
&gt; + =3Dhead1 WARNINGS<br>
&gt; +<br>
&gt; +-The result of RSA_padding_check_PKCS1_type_2() is a very sensitive<b=
r>
&gt; +-information which can potentially be used to mount a Bleichenbacher<=
br>
&gt; ++The result of RSA_padding_check_PKCS1_type_2() is exactly the<br>
&gt; ++information which is used to mount a classical Bleichenbacher<br>
&gt; + padding oracle attack. This is an inherent weakness in the PKCS #1<b=
r>
&gt; + v1.5 padding design. Prefer PKCS1_OAEP padding. If that is not<br>
&gt; + possible, the result of RSA_padding_check_PKCS1_type_2() should be<b=
r>
&gt; +@@ -137,6 +137,9 @@ as this would create a small timing side channel =
which could be<br>
&gt; + used to mount a Bleichenbacher attack against any padding mode<br>
&gt; + including PKCS1_OAEP.<br>
&gt; +<br>
&gt; ++You should prefer the use of EVP PKEY APIs for PKCS#1 v1.5 decryptio=
n<br>
&gt; ++as they implement the necessary workarounds internally.<br>
&gt; ++<br>
&gt; + =3Dhead1 SEE ALSO<br>
&gt; +<br>
&gt; + L&lt;RSA_public_encrypt(3)&gt;,<br>
&gt; +diff --git a/doc/man3/RSA_public_encrypt.pod b/doc/man3/RSA_public_en=
crypt.pod<br>
&gt; +index 1d38073..bd3f835 100644<br>
&gt; +--- a/doc/man3/RSA_public_encrypt.pod<br>
&gt; ++++ b/doc/man3/RSA_public_encrypt.pod<br>
&gt; +@@ -52,8 +52,8 @@ Encrypting user data directly with RSA is insecure.=
<br>
&gt; +<br>
&gt; + =3Dback<br>
&gt; +<br>
&gt; +-B&lt;flen&gt; must not be more than RSA_size(B&lt;rsa&gt;) - 11 for =
the PKCS #1 v1.5<br>
&gt; +-based padding modes, not more than RSA_size(B&lt;rsa&gt;) - 42 for<b=
r>
&gt; ++When encrypting B&lt;flen&gt; must not be more than RSA_size(B&lt;rs=
a&gt;) - 11 for the<br>
&gt; ++PKCS #1 v1.5 based padding modes, not more than RSA_size(B&lt;rsa&gt=
;) - 42 for<br>
&gt; + RSA_PKCS1_OAEP_PADDING and exactly RSA_size(B&lt;rsa&gt;) for RSA_NO=
_PADDING.<br>
&gt; + When a padding mode other than RSA_NO_PADDING is in use, then<br>
&gt; + RSA_public_encrypt() will include some random bytes into the ciphert=
ext<br>
&gt; +@@ -92,6 +92,13 @@ which can potentially be used to mount a Bleichenb=
acher padding oracle<br>
&gt; + attack. This is an inherent weakness in the PKCS #1 v1.5 padding<br>
&gt; + design. Prefer RSA_PKCS1_OAEP_PADDING.<br>
&gt; +<br>
&gt; ++In OpenSSL before version 3.1.0, both the return value and the lengt=
h of<br>
&gt; ++returned value could be used to mount the Bleichenbacher attack.<br>
&gt; ++Since version 3.1.0, OpenSSL does not return an error in case of pad=
ding<br>
&gt; ++checks failed. Instead it generates a random message based on used p=
rivate<br>
&gt; ++key and provided ciphertext so that application code doesn&#39;t hav=
e to implement<br>
&gt; ++a side-channel secure error handling.<br>
&gt; ++<br>
&gt; + =3Dhead1 CONFORMING TO<br>
&gt; +<br>
&gt; + SSL, PKCS #1 v2.0<br>
&gt; +diff --git a/doc/man7/provider-asym_cipher.pod b/doc/man7/provider-as=
ym_cipher.pod<br>
&gt; +index 0976a26..2a8426a 100644<br>
&gt; +--- a/doc/man7/provider-asym_cipher.pod<br>
&gt; ++++ b/doc/man7/provider-asym_cipher.pod<br>
&gt; +@@ -234,6 +234,15 @@ The TLS protocol version first requested by the =
client.<br>
&gt; +<br>
&gt; + The negotiated TLS protocol version.<br>
&gt; +<br>
&gt; ++=3Ditem &quot;implicit-rejection&quot; (B&lt;OSSL_PKEY_PARAM_IMPLICI=
T_REJECTION&gt;) &lt;unsigned integer&gt;<br>
&gt; ++<br>
&gt; ++Gets of sets the use of the implicit rejection mechanism for RSA PKC=
S#1 v1.5<br>
&gt; ++decryption. When set (non zero value), the decryption API will retur=
n<br>
&gt; ++a deterministically random value if the PKCS#1 v1.5 padding check fa=
ils.<br>
&gt; ++This makes explotation of the Bleichenbacher significantly harder, e=
ven<br>
&gt; ++if the code using the RSA decryption API is not implemented in side-=
channel<br>
&gt; ++free manner. Set by default.<br>
&gt; ++<br>
&gt; + =3Dback<br>
&gt; +<br>
&gt; + OSSL_FUNC_asym_cipher_gettable_ctx_params() and OSSL_FUNC_asym_ciphe=
r_settable_ctx_params()<br>
&gt; +diff --git a/include/crypto/rsa.h b/include/crypto/rsa.h<br>
&gt; +index 949873d..f267e5d 100644<br>
&gt; +--- a/include/crypto/rsa.h<br>
&gt; ++++ b/include/crypto/rsa.h<br>
&gt; +@@ -83,6 +83,10 @@ int ossl_rsa_param_decode(RSA *rsa, const X509_ALG=
OR *alg);<br>
&gt; + RSA *ossl_rsa_key_from_pkcs8(const PKCS8_PRIV_KEY_INFO *p8inf,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OSSL_LIB_CTX *libctx, const char *propq=
);<br>
&gt; +<br>
&gt; ++int ossl_rsa_padding_check_PKCS1_type_2(OSSL_LIB_CTX *ctx,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
nsigned char *to, int tlen,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
onst unsigned char *from, int flen,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
nt num, unsigned char *kdk);<br>
&gt; + int ossl_rsa_padding_check_PKCS1_type_2_TLS(OSSL_LIB_CTX *ctx, unsig=
ned char *to,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0size_t tlen,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0const unsigned char *from,<br>
&gt; +diff --git a/include/openssl/core_names.h b/include/openssl/core_name=
s.h<br>
&gt; +index 6bed5a8..5a350b5 100644<br>
&gt; +--- a/include/openssl/core_names.h<br>
&gt; ++++ b/include/openssl/core_names.h<br>
&gt; +@@ -292,6 +292,7 @@ extern &quot;C&quot; {<br>
&gt; + #define OSSL_PKEY_PARAM_DIST_ID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;distid&quot;<br>
&gt; + #define OSSL_PKEY_PARAM_PUB_KEY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;pub&quot;<br>
&gt; + #define OSSL_PKEY_PARAM_PRIV_KEY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;priv&quot;<br>
&gt; ++#define OSSL_PKEY_PARAM_IMPLICIT_REJECTION=C2=A0 &quot;implicit-reje=
ction&quot;<br>
&gt; +<br>
&gt; + /* Diffie-Hellman/DSA Parameters */<br>
&gt; + #define OSSL_PKEY_PARAM_FFC_P=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;p&quot;<br>
&gt; +@@ -467,6 +468,7 @@ extern &quot;C&quot; {<br>
&gt; + #define OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;oaep-label&quot;<br>
&gt; + #define OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT_VERSION=C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;tls-client-version&quot;<br>
&gt; + #define OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSION=C2=A0 =C2=A0&q=
uot;tls-negotiated-version&quot;<br>
&gt; ++#define OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION=C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;implicit-rejection&quot;<br>
&gt; +<br>
&gt; + /*<br>
&gt; +=C2=A0 * Encoder / decoder parameters<br>
&gt; +diff --git a/include/openssl/rsa.h b/include/openssl/rsa.h<br>
&gt; +index a55c972..247f901 100644<br>
&gt; +--- a/include/openssl/rsa.h<br>
&gt; ++++ b/include/openssl/rsa.h<br>
&gt; +@@ -183,6 +183,8 @@ int EVP_PKEY_CTX_get0_rsa_oaep_label(EVP_PKEY_CTX=
 *ctx, unsigned char **label);<br>
&gt; +<br>
&gt; + # define EVP_PKEY_CTRL_RSA_KEYGEN_PRIMES=C2=A0 (EVP_PKEY_ALG_CTRL + =
13)<br>
&gt; +<br>
&gt; ++# define EVP_PKEY_CTRL_RSA_IMPLICIT_REJECTION (EVP_PKEY_ALG_CTRL + 1=
4)<br>
&gt; ++<br>
&gt; + # define RSA_PKCS1_PADDING=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
&gt; + # define RSA_NO_PADDING=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A03<br>
&gt; + # define RSA_PKCS1_OAEP_PADDING=C2=A0 =C2=A0 =C2=A04<br>
&gt; +@@ -192,6 +194,9 @@ int EVP_PKEY_CTX_get0_rsa_oaep_label(EVP_PKEY_CTX=
 *ctx, unsigned char **label);<br>
&gt; + # define RSA_PKCS1_PSS_PADDING=C2=A0 =C2=A0 =C2=A0 6<br>
&gt; + # define RSA_PKCS1_WITH_TLS_PADDING 7<br>
&gt; +<br>
&gt; ++/* internal RSA_ only */<br>
&gt; ++# define RSA_PKCS1_NO_IMPLICIT_REJECT_PADDING 8<br>
&gt; ++<br>
&gt; + # define RSA_PKCS1_PADDING_SIZE=C2=A0 =C2=A0 11<br>
&gt; +<br>
&gt; + # define RSA_set_app_data(s,arg)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RS=
A_set_ex_data(s,0,arg)<br>
&gt; +diff --git a/providers/implementations/asymciphers/rsa_enc.c b/provid=
ers/implementations/asymciphers/rsa_enc.c<br>
&gt; +index c8921ac..11a91e6 100644<br>
&gt; +--- a/providers/implementations/asymciphers/rsa_enc.c<br>
&gt; ++++ b/providers/implementations/asymciphers/rsa_enc.c<br>
&gt; +@@ -75,6 +75,8 @@ typedef struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* TLS padding */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int client_version;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int alt_version;<br>
&gt; ++=C2=A0 =C2=A0 /* PKCS#1 v1.5 decryption mode */<br>
&gt; ++=C2=A0 =C2=A0 unsigned int implicit_rejection;<br>
&gt; + } PROV_RSA_CTX;<br>
&gt; +<br>
&gt; + static void *rsa_newctx(void *provctx)<br>
&gt; +@@ -107,6 +109,7 @@ static int rsa_init(void *vprsactx, void *vrsa, c=
onst OSSL_PARAM params[],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0RSA_free(prsactx-&gt;rsa);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0prsactx-&gt;rsa =3D vrsa;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0prsactx-&gt;operation =3D operation;<br>
&gt; ++=C2=A0 =C2=A0 prsactx-&gt;implicit_rejection =3D 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (RSA_test_flags(prsactx-&gt;rsa, RSA_FLAG_=
TYPE_MASK)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case RSA_FLAG_TYPE_RSA:<br>
&gt; +@@ -199,6 +202,7 @@ static int rsa_decrypt(void *vprsactx, unsigned c=
har *out, size_t *outlen,<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PROV_RSA_CTX *prsactx =3D (PROV_RSA_CTX *)vprsact=
x;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; ++=C2=A0 =C2=A0 int pad_mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t len =3D RSA_size(prsactx-&gt;rsa);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!ossl_prov_is_running())<br>
&gt; +@@ -276,8 +280,12 @@ static int rsa_decrypt(void *vprsactx, unsigned =
char *out, size_t *outlen,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPENSSL_free(tbuf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D RSA_private_decrypt(inlen, in, o=
ut, prsactx-&gt;rsa,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prsactx-&gt;pad_mode);=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((prsactx-&gt;implicit_rejection =3D=
=3D 0) &amp;&amp;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (prsactx-&gt=
;pad_mode =3D=3D RSA_PKCS1_PADDING))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pad_mode =3D RSA_PKCS1_NO_=
IMPLICIT_REJECT_PADDING;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pad_mode =3D prsactx-&gt;p=
ad_mode;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D RSA_private_decrypt(inlen, in, o=
ut, prsactx-&gt;rsa, pad_mode);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*outlen =3D constant_time_select_s(constant_time_=
msb_s(ret), *outlen, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D constant_time_select_int(constant_time_ms=
b(ret), 0, 1);<br>
&gt; +@@ -401,6 +409,10 @@ static int rsa_get_ctx_params(void *vprsactx, OS=
SL_PARAM *params)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (p !=3D NULL &amp;&amp; !OSSL_PARAM_set_uint(p=
, prsactx-&gt;alt_version))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 p =3D OSSL_PARAM_locate(params, OSSL_ASYM_CIPHER_PARAM=
_IMPLICIT_REJECTION);<br>
&gt; ++=C2=A0 =C2=A0 if (p !=3D NULL &amp;&amp; !OSSL_PARAM_set_uint(p, prs=
actx-&gt;implicit_rejection))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; + }<br>
&gt; +<br>
&gt; +@@ -412,6 +424,7 @@ static const OSSL_PARAM known_gettable_ctx_params=
[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0NULL, 0),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT=
_VERSION, NULL),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTI=
ATED_VERSION, NULL),<br>
&gt; ++=C2=A0 =C2=A0 OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECT=
ION, NULL),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0OSSL_PARAM_END<br>
&gt; + };<br>
&gt; +<br>
&gt; +@@ -549,6 +562,14 @@ static int rsa_set_ctx_params(void *vprsactx, co=
nst OSSL_PARAM params[])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prsactx-&gt;alt_version =3D alt_ver=
sion;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++=C2=A0 =C2=A0 p =3D OSSL_PARAM_locate_const(params, OSSL_ASYM_CIPHER=
_PARAM_IMPLICIT_REJECTION);<br>
&gt; ++=C2=A0 =C2=A0 if (p !=3D NULL) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int implicit_rejection;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!OSSL_PARAM_get_uint(p, &amp;implici=
t_rejection))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 prsactx-&gt;implicit_rejection =3D impli=
cit_rejection;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; + }<br>
&gt; +@@ -562,6 +583,7 @@ static const OSSL_PARAM known_settable_ctx_params=
[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0OSSL_PARAM_octet_string(OSSL_ASYM_CIPHER_PARAM_OA=
EP_LABEL, NULL, 0),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT=
_VERSION, NULL),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTI=
ATED_VERSION, NULL),<br>
&gt; ++=C2=A0 =C2=A0 OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECT=
ION, NULL),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0OSSL_PARAM_END<br>
&gt; + };<br>
&gt; +<br>
&gt; +diff --git a/test/recipes/30-test_evp_data/evppkey_rsa_common.txt b/t=
est/recipes/30-test_evp_data/evppkey_rsa_common.txt<br>
&gt; +index 5f3b396..064d8a2 100644<br>
&gt; +--- a/test/recipes/30-test_evp_data/evppkey_rsa_common.txt<br>
&gt; ++++ b/test/recipes/30-test_evp_data/evppkey_rsa_common.txt<br>
&gt; +@@ -253,10 +253,24 @@ Decrypt =3D RSA-2048<br>
&gt; + Input =3D 550AF55A2904E7B9762352F8FB7FA235A9CB053AACB2D5FCB8CA48453C=
B2EE3619746C701ABF2D4CC67003471A187900B05AA812BD25ED05C675DFC8C97A24A7BF49B=
D6214992CAD766D05A9A2B57B74F26A737E0237B8B76C45F1F226A836D7CFBC75BA999BDBE4=
8DBC09227AA46C88F21DCCBA7840141AD5A5D71FD122E6BD6AC3E564780DFE623FC1CA9B995=
A6037BF0BBD43B205A84AC5444F34202C05CE9113087176432476576DE6FFFF9A52EA57C08B=
E3EC2F49676CB8E12F762AC71FA3C321E00AC988910C85FF52F93825666CE0D40FFAA059207=
8919D4493F46D95CCF76364C6D57760DD0B64805F9AFC76A2365A5575CA301D5103F0EA76CB=
9A78<br>
&gt; + Output =3D &quot;Hello World&quot;<br>
&gt; +<br>
&gt; ++# Note: disable the Bleichenbacher workaround to see if it passes<br=
>
&gt; ++Decrypt =3D RSA-2048<br>
&gt; ++Ctrl =3D rsa_pkcs1_implicit_rejection:0<br>
&gt; ++Input =3D 550AF55A2904E7B9762352F8FB7FA235A9CB053AACB2D5FCB8CA48453C=
B2EE3619746C701ABF2D4CC67003471A187900B05AA812BD25ED05C675DFC8C97A24A7BF49B=
D6214992CAD766D05A9A2B57B74F26A737E0237B8B76C45F1F226A836D7CFBC75BA999BDBE4=
8DBC09227AA46C88F21DCCBA7840141AD5A5D71FD122E6BD6AC3E564780DFE623FC1CA9B995=
A6037BF0BBD43B205A84AC5444F34202C05CE9113087176432476576DE6FFFF9A52EA57C08B=
E3EC2F49676CB8E12F762AC71FA3C321E00AC988910C85FF52F93825666CE0D40FFAA059207=
8919D4493F46D95CCF76364C6D57760DD0B64805F9AFC76A2365A5575CA301D5103F0EA76CB=
9A78<br>
&gt; ++Output =3D &quot;Hello World&quot;<br>
&gt; ++<br>
&gt; + # Corrupted ciphertext<br>
&gt; ++# Note: output is generated synthethically by the Bleichenbacher wor=
karound<br>
&gt; + FIPSversion =3D &lt;3.2.0<br>
&gt; + Decrypt =3D RSA-2048<br>
&gt; + Input =3D 550AF55A2904E7B9762352F8FB7FA235A9CB053AACB2D5FCB8CA48453C=
B2EE3619746C701ABF2D4CC67003471A187900B05AA812BD25ED05C675DFC8C97A24A7BF49B=
D6214992CAD766D05A9A2B57B74F26A737E0237B8B76C45F1F226A836D7CFBC75BA999BDBE4=
8DBC09227AA46C88F21DCCBA7840141AD5A5D71FD122E6BD6AC3E564780DFE623FC1CA9B995=
A6037BF0BBD43B205A84AC5444F34202C05CE9113087176432476576DE6FFFF9A52EA57C08B=
E3EC2F49676CB8E12F762AC71FA3C321E00AC988910C85FF52F93825666CE0D40FFAA059207=
8919D4493F46D95CCF76364C6D57760DD0B64805F9AFC76A2365A5575CA301D5103F0EA76CB=
9A79<br>
&gt; ++Output =3D 4cbb988d6a46228379132b0b5f8c249b3860043848c93632fb982c807=
c7c82fffc7a9ef83f4908f890373ac181ffea6381e103bcaa27e65638b6ecebef38b59ed422=
6a9d12af675cfcb634d8c40e7a7aff<br>
&gt; ++<br>
&gt; ++# Corrupted ciphertext<br>
&gt; ++# Note: disable the Bleichenbacher workaround to see if it fails<br>
&gt; ++Decrypt =3D RSA-2048<br>
&gt; ++Ctrl =3D rsa_pkcs1_implicit_rejection:0<br>
&gt; ++Input =3D 550AF55A2904E7B9762352F8FB7FA235A9CB053AACB2D5FCB8CA48453C=
B2EE3619746C701ABF2D4CC67003471A187900B05AA812BD25ED05C675DFC8C97A24A7BF49B=
D6214992CAD766D05A9A2B57B74F26A737E0237B8B76C45F1F226A836D7CFBC75BA999BDBE4=
8DBC09227AA46C88F21DCCBA7840141AD5A5D71FD122E6BD6AC3E564780DFE623FC1CA9B995=
A6037BF0BBD43B205A84AC5444F34202C05CE9113087176432476576DE6FFFF9A52EA57C08B=
E3EC2F49676CB8E12F762AC71FA3C321E00AC988910C85FF52F93825666CE0D40FFAA059207=
8919D4493F46D95CCF76364C6D57760DD0B64805F9AFC76A2365A5575CA301D5103F0EA76CB=
9A79<br>
&gt; + Output =3D &quot;Hello World&quot;<br>
&gt; + Result =3D KEYOP_ERROR<br>
&gt; +<br>
&gt; +@@ -278,6 +292,462 @@ Derive =3D RSA-2048<br>
&gt; + Result =3D KEYOP_INIT_ERROR<br>
&gt; + Reason =3D operation not supported for this keytype<br>
&gt; +<br>
&gt; ++# Test vectors for the Bleichenbacher workaround<br>
&gt; ++<br>
&gt; ++PrivateKey =3D RSA-2048-2<br>
&gt; ++-----BEGIN RSA PRIVATE KEY-----<br>
&gt; ++MIIEowIBAAKCAQEAyMyDlxQJjaVsqiNkD5PciZfBY3KWj8Gwxt9RE8HJTosh5IrS<br>
&gt; ++KX5lQZARtObY9ec7G3iyV0ADIdHva2AtTsjOjRQclJBetK0wZjmkkgZTS25/JgdC<br>
&gt; ++Ppff/RM8iNchOZ3vvH6WzNy9fzquH+iScSv7SSmBfVEWZkQKH6y3ogj16hZZEK3Y<br>
&gt; ++o/LUlyAjYMy2MgJPDQcWnBkY8xb3lLFDrvVOyHUipMApePlomYC/+/ZJwwfoGBm/<br>
&gt; +++IQJY41IvZS+FStZ/2SfoL1inQ/6GBPDq/S1a9PC6lRl3/oUWJKSqdiiStJr5+4F<br>
&gt; ++EHQbY4LUPIPVv6QKRmE9BivkRVF9vK8MtOGnaQIDAQABAoIBABRVAQ4PLVh2Y6Zm<br>
&gt; ++pv8czbvw7dgQBkbQKgI5IpCJksStOeVWWSlybvZQjDpxFY7wtv91HTnQdYC7LS8G<br>
&gt; ++MhBELQYD/1DbvXs1/iybsZpHoa+FpMJJAeAsqLWLeRmyDt8yqs+/Ua20vEthubfp<br>
&gt; ++aMqk1XD3DvGNgGMiiJPkfUOe/KeTJZvPLNEIo9hojN8HjnrHmZafIznSwfUiuWlo<br>
&gt; ++RimpM7quwmgWJeq4T05W9ER+nYj7mhmc9xAj4OJXsURBszyE07xnyoAx0mEmGBA6<br>
&gt; ++egpAhEJi912IkM1hblH5A1SI/W4Jnej/bWWk/xGCVIB8n1jS+7qLoVHcjGi+NJyX<br>
&gt; ++eiBOBMECgYEA+PWta6gokxvqRZuKP23AQdI0gkCcJXHpY/MfdIYColY3GziD7UWe<br>
&gt; ++z5cFJkWe3RbgVSL1pF2UdRsuwtrycsf4gWpSwA0YCAFxY02omdeXMiL1G5N2MFSG<br>
&gt; ++lqn32MJKWUl8HvzUVc+5fuhtK200lyszL9owPwSZm062tcwLsz53Yd0CgYEAznou<br>
&gt; ++O0mpC5YzChLcaCvfvfuujdbcA7YUeu+9V1dD8PbaTYYjUGG3Gv2crS00Al5WrIaw<br>
&gt; ++93Q+s14ay8ojeJVCRGW3Bu0iF15XGMjHC2cD6o9rUQ+UW+SOWja7PDyRcytYnfwF<br>
&gt; ++1y2AkDGURSvaITSGR+xylD8RqEbmL66+jrU2sP0CgYB2/hXxiuI5zfHfa0RcpLxr<br>
&gt; ++uWjXiMIZM6T13NKAAz1nEgYswIpt8gTB+9C+RjB0Q+bdSmRWN1Qp1OA4yiVvrxyb<br>
&gt; ++3pHGsXt2+BmV+RxIy768e/DjSUwINZ5OjNalh9e5bWIh/X4PtcVXXwgu5XdpeYBx<br>
&gt; ++sru0oyI4FRtHMUu2VHkDEQKBgQCZiEiwVUmaEAnLx9KUs2sf/fICDm5zZAU+lN4a<br>
&gt; ++AA3JNAWH9+JydvaM32CNdTtjN3sDtvQITSwCfEs4lgpiM7qe2XOLdvEOp1vkVgeL<br>
&gt; ++9wH2fMaz8/3BhuZDNsdrNy6AkQ7ICwrcwj0C+5rhBIaigkgHW06n5W3fzziC5FFW<br>
&gt; ++FHGikQKBgGQ790ZCn32DZnoGUwITR++/wF5jUfghqd67YODszeUAWtnp7DHlWPfp<br>
&gt; ++LCkyjnRWnXzvfHTKvCs1XtQBoaCRS048uwZITlgZYFEWntFMqi76bqBE4FTSYUTM<br>
&gt; ++FinFUBBVigThM/RLfCRNrCW/kTxXuJDuSfVIJZzWNAT+9oWdz5da<br>
&gt; ++-----END RSA PRIVATE KEY-----<br>
&gt; ++<br>
&gt; ++# corresponding public key<br>
&gt; ++PublicKey =3D RSA-2048-2-PUBLIC<br>
&gt; ++-----BEGIN PUBLIC KEY-----<br>
&gt; ++MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyMyDlxQJjaVsqiNkD5Pc<br>
&gt; ++iZfBY3KWj8Gwxt9RE8HJTosh5IrSKX5lQZARtObY9ec7G3iyV0ADIdHva2AtTsjO<br>
&gt; ++jRQclJBetK0wZjmkkgZTS25/JgdCPpff/RM8iNchOZ3vvH6WzNy9fzquH+iScSv7<br>
&gt; ++SSmBfVEWZkQKH6y3ogj16hZZEK3Yo/LUlyAjYMy2MgJPDQcWnBkY8xb3lLFDrvVO<br>
&gt; ++yHUipMApePlomYC/+/ZJwwfoGBm/+IQJY41IvZS+FStZ/2SfoL1inQ/6GBPDq/S1<br>
&gt; ++a9PC6lRl3/oUWJKSqdiiStJr5+4FEHQbY4LUPIPVv6QKRmE9BivkRVF9vK8MtOGn<br>
&gt; ++aQIDAQAB<br>
&gt; ++-----END PUBLIC KEY-----<br>
&gt; ++<br>
&gt; ++PrivPubKeyPair =3D RSA-2048-2:RSA-2048-2-PUBLIC<br>
&gt; ++<br>
&gt; ++# RSA decrypt<br>
&gt; ++<br>
&gt; ++# a random positive test case<br>
&gt; ++Availablein =3D default<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D 8bfe264e85d3bdeaa6b8851b8e3b956ee3d226fd3f69063a86880173a2=
73d9f283b2eebdd1ed35f7e02d91c571981b6737d5320bd8396b0f3ad5b019daec1b0aab3cb=
bc026395f4fd14f13673f2dfc81f9b660ec26ac381e6db3299b4e460b43fab9955df2b3cfaa=
20e900e19c856238fd371899c2bf2ce8c868b76754e5db3b036533fd603746be13c10d4e3e6=
022ebc905d20c2a7f32b215a4cd53b3f44ca1c327d2c2b651145821c08396c89071f665349c=
25e44d2733cd9305985ceef6430c3cf57af5fa224089221218fa34737c79c446d28a94c41c9=
6e4e92ac53fbcf384dea8419ea089f8784445a492c812eb0d409467f75afd7d4d1078886205=
a066<br>
&gt; ++Output =3D &quot;lorem ipsum dolor sit amet&quot;<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# a random negative test case decrypting to empty<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D 20aaa8adbbc593a924ba1c5c7990b5c2242ae4b99d0fe636a19a4cf754=
edbcee774e472fe028160ed42634f8864900cb514006da642cae6ae8c7d087caebcfa6dad15=
51301e130344989a1d462d4164505f6393933450c67bc6d39d8f5160907cabc251b737925a1=
cf21e5c6aa5781b7769f6a2a583d97cce008c0f8b6add5f0b2bd80bee60237aa39bb20719fe=
75749f4bc4e42466ef5a861ae3a92395c7d858d430bfe38040f445ea93fa2958b503539800f=
fa5ce5f8cf51fa8171a91f36cb4f4575e8de6b4d3f096ee140b938fd2f50ee13f0d050222e2=
a72b0a3069ff3a6738e82c87090caa5aed4fcbe882c49646aa250b98f12f83c8d528113614a=
29e7<br>
&gt; ++Output =3D<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# invalid decrypting to max length message<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D 48cceab10f39a4db32f60074feea473cbcdb7accf92e150417f76b4475=
6b190e843e79ec12aa85083a21f5437e7bad0a60482e601198f9d86923239c8786ee728285a=
fd0937f7dde12717f28389843d7375912b07b991f4fdb0190fced8ba665314367e8c5f9d298=
1d0f5128feeb46cb50fc237e64438a86df198dd0209364ae3a842d77532b66b7ef263b83b15=
41ed671b120dfd660462e2107a4ee7b964e734a7bd68d90dda61770658a3c242948532da326=
48687e0318286473f675b412d6468f013f14d760a358dfcad3cda2afeec5e268a37d250c37f=
722f468a70dfd92d7294c3c1ee1e7f8843b7d16f9f37ef35748c3ae93aa155cdcdfeb4e7856=
7303<br>
&gt; ++Output =3D 22d850137b9eebe092b24f602dc5bb7918c16bd89ddbf20467b119d20=
5f9c2e4bd7d2592cf1e532106e0f33557565923c73a02d4f09c0c22bea89148183e60317f70=
28b3aa1f261f91c979393101d7e15f4067e63979b32751658ef769610fe97cf9cef3278b311=
7d384051c3b1d82c251c2305418c8f6840530e631aad63e70e20e025bcd8efb54c92ec6d3b1=
06a2f8e64eeff7d38495b0fc50c97138af4b1c0a67a1c4e27b077b8439332edfa8608dfeae6=
53cd6a628ac550395f7e74390e42c11682234870925eeaa1fa71b76cf1f2ee3bda69f671703=
3ff8b7c95c9799e7a3bea5e7e4a1c359772fb6b1c6e6c516661dfe30c3<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# invalid decrypting to message with length specified by second to l=
ast value from PRF<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D 1439e08c3f84c1a7fec74ce07614b20e01f6fa4e8c2a6cffdc3520d888=
9e5d9a950c6425798f85d4be38d300ea5695f13ecd4cb389d1ff5b82484b494d6280ab7fa78=
e645933981cb934cce8bfcd114cc0e6811eefa47aae20af638a1cd163d2d3366186d0a07df0=
c81f6c9f3171cf3561472e98a6006bf75ddb457bed036dcce199369de7d94ef2c68e8467ee0=
604eea2b3009479162a7891ba5c40cab17f49e1c438cb6eaea4f76ce23cce0e483ff0e96fa7=
90ea15be67671814342d0a23f4a20262b6182e72f3a67cd289711503c85516a9ed225422f98=
b116f1ab080a80abd6f0216df88d8cfd67c139243be8dd78502a7aaf6bc99d7da71bcdf627e=
7354<br>
&gt; ++Output =3D 0f9b<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# invalid decrypting to message with length specified by third to la=
st value from PRF<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D 1690ebcceece2ce024f382e467cf8510e74514120937978576caf684d4=
a02ad569e8d76cbe365a060e00779de2f0865ccf0d923de3b4783a4e2c74f422e2f326086c3=
90b658ba47f31ab013aa80f468c71256e5fa5679b24e83cd82c3d1e05e398208155de221299=
3cd2b8bab6987cf4cc1293f19909219439d74127545e9ed8a706961b8ee2119f6bfacafbef9=
1b75a789ba65b8b833bc6149cf49b5c4d2c6359f62808659ba6541e1cd24bf7f7410486b510=
3f6c0ea29334ea6f4975b17387474fe920710ea61568d7b7c0a7916acf21665ad5a31c4eabc=
de44f8fb6120d8457afa1f3c85d517cda364af620113ae5a3c52a048821731922737307f77a=
1081<br>
&gt; ++Output =3D 4f02<br>
&gt; ++<br>
&gt; ++# positive test with 11 byte long value<br>
&gt; ++Availablein =3D default<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D 6213634593332c485cef783ea2846e3d6e8b0e005cd8293eaebbaa5079=
712fd681579bdfbbda138ae4d9d952917a03c92398ec0cb2bb0c6b5a8d55061fed0d0d8d724=
73563152648cfe640b335dc95331c21cb133a91790fa93ae44497c128708970d2beeb77e872=
1b061b1c44034143734a77be8220877415a6dba073c3871605380542a9f25252a4babe8331c=
dd53cf828423f3cc70b560624d0581fb126b2ed4f4ed358f0eb8065cf176399ac1a846a3105=
5f9ae8c9c24a1ba050bc20842125bc1753158f8065f3adb9cc16bfdf83816bdf38b624f1202=
2c5a6fbfe29bc91542be8c0208a770bcd677dc597f5557dc2ce28a11bf3e3857f158717a33f=
6592<br>
&gt; ++Output =3D &quot;lorem ipsum&quot;<br>
&gt; ++<br>
&gt; ++# positive test with 11 byte long value and zero padded ciphertext<b=
r>
&gt; ++Availablein =3D default<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D 00a2e8f114ea8d05d12dc843e3cc3b2edc8229ff2a028bda29ba9d55e3=
cd02911902fef1f42a075bf05e8016e8567213d6f260fa49e360779dd81aeea3e04c2cb567e=
0d72b98bf754014561b7511e083d20e0bfb9cd23f8a0d3c88900c49d2fcd5843ff0765607b2=
026f28202a87aa94678aed22a0c20724541394cd8f44e373eba1d2bae98f516c1e2ba3d8685=
2d064f856b1daf24795e767a2b90396e50743e3150664afab131fe40ea405dcf572dd1079af=
1d3f0392ccadcca0a12740dbb213b925ca2a06b1bc1383e83a658c82ba2e7427342379084d5=
f66b544579f07664cb26edd4f10fd913fdbc0de05ef887d4d1ec1ac95652397ea7fd4e4759f=
da8b<br>
&gt; ++Output =3D &quot;lorem ipsum&quot;<br>
&gt; ++<br>
&gt; ++# positive test with 11 byte long value and zero truncated ciphertex=
t<br>
&gt; ++Availablein =3D default<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D a2e8f114ea8d05d12dc843e3cc3b2edc8229ff2a028bda29ba9d55e3cd=
02911902fef1f42a075bf05e8016e8567213d6f260fa49e360779dd81aeea3e04c2cb567e0d=
72b98bf754014561b7511e083d20e0bfb9cd23f8a0d3c88900c49d2fcd5843ff0765607b202=
6f28202a87aa94678aed22a0c20724541394cd8f44e373eba1d2bae98f516c1e2ba3d86852d=
064f856b1daf24795e767a2b90396e50743e3150664afab131fe40ea405dcf572dd1079af1d=
3f0392ccadcca0a12740dbb213b925ca2a06b1bc1383e83a658c82ba2e7427342379084d5f6=
6b544579f07664cb26edd4f10fd913fdbc0de05ef887d4d1ec1ac95652397ea7fd4e4759fda=
8b<br>
&gt; ++Output =3D &quot;lorem ipsum&quot;<br>
&gt; ++<br>
&gt; ++# positive test with 11 byte long value and double zero padded ciphe=
rtext<br>
&gt; ++Availablein =3D default<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D 00001f71879b426127f7dead621f7380a7098cf7d22173aa27991b143c=
46d53383c209bd0c9c00d84078037e715f6b98c65005a77120070522ede51d472c87ef94b94=
ead4c5428ee108a345561658301911ec5a8f7dd43ed4a3957fd29fb02a3529bf63f8040d395=
3490939bd8f78b2a3404b6fb5ff70a4bfdaac5c541d6bcce49c9778cc390be24cbef1d1eca7=
e870457241d3ff72ca44f9f56bdf31a890fa5eb3a9107b603ccc9d06a5dd911a664c82b6abd=
4fe036f8db8d5a070c2d86386ae18d97adc1847640c211d91ff5c3387574a26f8ef27ca7f48=
d2dd1f0c7f14b81cc9d33ee6853031d3ecf10a914ffd90947909c8011fd30249219348ebff7=
6bfc<br>
&gt; ++Output =3D &quot;lorem ipsum&quot;<br>
&gt; ++<br>
&gt; ++# positive test with 11 byte long value and double zero truncated ci=
phertext<br>
&gt; ++Availablein =3D default<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D 1f71879b426127f7dead621f7380a7098cf7d22173aa27991b143c46d5=
3383c209bd0c9c00d84078037e715f6b98c65005a77120070522ede51d472c87ef94b94ead4=
c5428ee108a345561658301911ec5a8f7dd43ed4a3957fd29fb02a3529bf63f8040d3953490=
939bd8f78b2a3404b6fb5ff70a4bfdaac5c541d6bcce49c9778cc390be24cbef1d1eca7e870=
457241d3ff72ca44f9f56bdf31a890fa5eb3a9107b603ccc9d06a5dd911a664c82b6abd4fe0=
36f8db8d5a070c2d86386ae18d97adc1847640c211d91ff5c3387574a26f8ef27ca7f48d2dd=
1f0c7f14b81cc9d33ee6853031d3ecf10a914ffd90947909c8011fd30249219348ebff76bfc=
<br>
&gt; ++Output =3D &quot;lorem ipsum&quot;<br>
&gt; ++<br>
&gt; ++# positive that generates a 0 byte long synthethic message internall=
y<br>
&gt; ++Availablein =3D default<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D b5e49308f6e9590014ffaffc5b8560755739dd501f1d4e9227a7d29140=
8cf4b753f292322ff8bead613bf2caa181b221bc38caf6392deafb28eb21ad60930841ed02f=
d6225cc9c463409adbe7d8f32440212fbe3881c51375bb09565efb22e62b071472fb38676e5=
b4e23a0617db5d14d93519ac0007a30a9c822eb31c38b57fcb1be29608fcf1ca2abdcaf5d57=
52bbc2b5ac7dba5afcff4a5641da360dd01f7112539b1ed46cdb550a3b1006559b9fe189103=
0ec80f0727c42401ddd6cbb5e3c80f312df6ec89394c5a7118f573105e7ab00fe57833c1261=
41b50a935224842addfb479f75160659ba28877b512bb9a93084ad8bec540f92640f63a11a0=
10e0<br>
&gt; ++Output =3D &quot;lorem ipsum&quot;<br>
&gt; ++<br>
&gt; ++# positive that generates a 245 byte long synthethic message interna=
lly<br>
&gt; ++Availablein =3D default<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D 1ea0b50ca65203d0a09280d39704b24fe6e47800189db5033f202761a7=
8bafb270c5e25abd1f7ecc6e7abc4f26d1b0cd9b8c648d529416ee64ccbdd7aa72a771d0353=
262b543f0e436076f40a1095f5c7dfd10dcf0059ccb30e92dfa5e0156618215f1c3ff3aa997=
a9d999e506924f5289e3ac72e5e2086cc7b499d71583ed561028671155db4005bee01800a7c=
dbdae781dd32199b8914b5d4011dd6ff11cd26d46aad54934d293b0bc403dd211bf13b5a5c6=
836a5e769930f437ffd8634fb7371776f4bc88fa6c271d8aa6013df89ae6470154497c4ac86=
1be2a1c65ebffec139bf7aaba3a81c7c5cdd84da9af5d3edfb957848074686b5837ecbcb6a4=
1c50<br>
&gt; ++Output =3D &quot;lorem ipsum&quot;<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# a random negative test that generates an 11 byte long message<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D 5f02f4b1f46935c742ebe62b6f05aa0a3286aab91a49b34780adde6410=
ab46f7386e05748331864ac98e1da63686e4babe3a19ed40a7f5ceefb89179596aab07ab101=
5e03b8f825084dab028b6731288f2e511a4b314b6ea3997d2e8fe2825cef8897cbbdfb6c939=
d441d6e04948414bb69e682927ef8576c9a7090d4aad0e74c520d6d5ce63a154720f00b76de=
8cc550b1aa14f016d63a7b6d6eaa1f7dbe9e50200d3159b3d099c900116bf4eba3b94204f18=
b1317b07529751abf64a26b0a0bf1c8ce757333b3d673211b67cc0653f2fe2620d57c8b6ee5=
74a0323a167eab1106d9bc7fd90d415be5f1e9891a0e6c709f4fc0404e8226f8477b4e939b3=
6eb2<br>
&gt; ++Output =3D af9ac70191c92413cb9f2d<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# an otherwise correct plaintext, but with wrong first byte<br>
&gt; ++# (0x01 instead of 0x00), generates a random 11 byte long plaintext<=
br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D 9b2ec9c0c917c98f1ad3d0119aec6be51ae3106e9af1914d48600ab6a2=
c0c0c8ae02a2dc3039906ff3aac904af32ec798fd65f3ad1afa2e69400e7c1de81f5728f3b3=
291f38263bc7a90a0563e43ce7a0d4ee9c0d8a716621ca5d3d081188769ce1b131af7d35b13=
dea99153579c86db31fe07d5a2c14d621b77854e48a8df41b5798563af489a291e417b6a334=
c63222627376118c02c53b6e86310f728734ffc86ef9d7c8bf56c0c841b24b82b59f51aee45=
26ba1c4268506d301e4ebc498c6aebb6fd5258c876bf900bac8ca4d309dd522f6a6343599a8=
bc3760f422c10c72d0ad527ce4af1874124ace3d99bb74db8d69d2528db22c3a37644640f95=
c05f<br>
&gt; ++Output =3D a1f8c9255c35cfba403ccc<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# an otherwise correct plaintext, but with wrong second byte<br>
&gt; ++# (0x01 instead of 0x02), generates a random 11 byte long plaintext<=
br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D 782c2b59a21a511243820acedd567c136f6d3090c115232a82a5efb0b1=
78285f55b5ec2d2bac96bf00d6592ea7cdc3341610c8fb07e527e5e2d20cfaf2c7f23e37543=
1f45e998929a02f25fd95354c33838090bca838502259e92d86d568bc2cdb132fab2a399593=
ca60a015dc2bb1afcd64fef8a3834e17e5358d822980dc446e845b3ab4702b1ee41fe5db716=
d92348d5091c15d35a110555a35deb4650a5a1d2c98025d42d4544f8b32aa6a5e02dc02deae=
d9a7313b73b49b0d4772a3768b0ea0db5846ace6569cae677bf67fb0acf3c255dc01ec8400c=
963b6e49b1067728b4e563d7e1e1515664347b92ee64db7efb5452357a02fff7fcb7437abc2=
e579<br>
&gt; ++Output =3D e6d700309ca0ed62452254<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# an invalid ciphertext, with a zero byte in first byte of<br>
&gt; ++# ciphertext, decrypts to a random 11 byte long synthethic<br>
&gt; ++# plaintext<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D 0096136621faf36d5290b16bd26295de27f895d1faa51c800dafce73d0=
01d60796cd4e2ac3fa2162131d859cd9da5a0c8a42281d9a63e5f353971b72e36b5722e4ac4=
44d77f892a5443deb3dca49fa732fe855727196e23c26eeac55eeced8267a209ebc0f92f465=
6d64a6c13f7f7ce544ebeb0f668fe3a6c0f189e4bcd5ea12b73cf63e0c8350ee130dd62f01e=
5c97a1e13f52fde96a9a1bc9936ce734fdd61f27b18216f1d6de87f49cf4f2ea821fb8efd1f=
92cdad529baf7e31aff9bff4074f2cad2b4243dd15a711adcf7de900851fbd6bcb53dac399d=
7c880531d06f25f7002e1aaf1722765865d2c2b902c7736acd27bc6cbd3e38b560e2eecf7d4=
b576<br>
&gt; ++Output =3D ba27b1842e7c21c0e7ef6a<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# an invalid ciphertext, with a zero byte removed from first byte of=
<br>
&gt; ++# ciphertext, decrypts to a random 11 byte long synthethic<br>
&gt; ++# plaintext<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D 96136621faf36d5290b16bd26295de27f895d1faa51c800dafce73d001=
d60796cd4e2ac3fa2162131d859cd9da5a0c8a42281d9a63e5f353971b72e36b5722e4ac444=
d77f892a5443deb3dca49fa732fe855727196e23c26eeac55eeced8267a209ebc0f92f4656d=
64a6c13f7f7ce544ebeb0f668fe3a6c0f189e4bcd5ea12b73cf63e0c8350ee130dd62f01e5c=
97a1e13f52fde96a9a1bc9936ce734fdd61f27b18216f1d6de87f49cf4f2ea821fb8efd1f92=
cdad529baf7e31aff9bff4074f2cad2b4243dd15a711adcf7de900851fbd6bcb53dac399d7c=
880531d06f25f7002e1aaf1722765865d2c2b902c7736acd27bc6cbd3e38b560e2eecf7d4b5=
76<br>
&gt; ++Output =3D ba27b1842e7c21c0e7ef6a<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# an invalid ciphertext, with two zero bytes in first bytes of<br>
&gt; ++# ciphertext, decrypts to a random 11 byte long synthethic<br>
&gt; ++# plaintext<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D 0000587cccc6b264bdfe0dc2149a988047fa921801f3502ea64624c510=
c6033d2f427e3f136c26e88ea9f6519e86a542cec96aad1e5e9013c3cc203b6de15a6918305=
0813af5c9ad79703136d4b92f50ce171eefc6aa7988ecf02f319ffc5eafd6ee7a137f8fce64=
b255bb1b8dd19cfe767d64fdb468b9b2e9e7a0c24dae03239c8c714d3f40b7ee9c4e59ac15b=
17e4d328f1100756bce17133e8e7493b54e5006c3cbcdacd134130c5132a1edebdbd01a0c41=
452d16ed7a0788003c34730d0808e7e14c797a21f2b45a8aa1644357fd5e988f99b017d9df3=
7563a354c788dc0e2f9466045622fa3f3e17db63414d27761f57392623a2bef6467501c63e8=
d645<br>
&gt; ++Output =3D d5cf555b1d6151029a429a<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# an invalid ciphertext, with two zero bytes removed from first byte=
s of<br>
&gt; ++# ciphertext, decrypts to a random 11 byte long synthethic<br>
&gt; ++# plaintext<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D 587cccc6b264bdfe0dc2149a988047fa921801f3502ea64624c510c603=
3d2f427e3f136c26e88ea9f6519e86a542cec96aad1e5e9013c3cc203b6de15a69183050813=
af5c9ad79703136d4b92f50ce171eefc6aa7988ecf02f319ffc5eafd6ee7a137f8fce64b255=
bb1b8dd19cfe767d64fdb468b9b2e9e7a0c24dae03239c8c714d3f40b7ee9c4e59ac15b17e4=
d328f1100756bce17133e8e7493b54e5006c3cbcdacd134130c5132a1edebdbd01a0c41452d=
16ed7a0788003c34730d0808e7e14c797a21f2b45a8aa1644357fd5e988f99b017d9df37563=
a354c788dc0e2f9466045622fa3f3e17db63414d27761f57392623a2bef6467501c63e8d645=
<br>
&gt; ++Output =3D d5cf555b1d6151029a429a<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# and invalid ciphertext, otherwise valid but starting with 000002, =
decrypts<br>
&gt; ++# to random 11 byte long synthethic plaintext<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D 1786550ce8d8433052e01ecba8b76d3019f1355b212ac9d0f5191b0233=
25a7e7714b7802f8e9a17c4cb3cd3a84041891471b10ca1fcfb5d041d34c82e6d0011cf4dc7=
6b90e9c2e0743590579d55bcd7857057152c4a8040361343d1d22ba677d62b011407c652e23=
4b1d663af25e2386251d7409190f19fc8ec3f9374fdf1254633874ce2ec2bff40ad0cb473f9=
761ec7b68da45a4bd5e33f5d7dac9b9a20821df9406b653f78a95a6c0ea0a4d57f867e4db22=
c17bf9a12c150f809a7b72b6db86c22a8732241ebf3c6a4f2cf82671d917aba8bc61052b40c=
cddd743a94ea9b538175106201971cca9d136d25081739aaf6cd18b2aecf9ad320ea3f89502=
f955<br>
&gt; ++Output =3D 3d4a054d9358209e9cbbb9<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# negative test with otherwise valid padding but a zero byte in firs=
t byte<br>
&gt; ++# of padding<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D 179598823812d2c58a7eb50521150a48bcca8b4eb53414018b6bca19f4=
801456c5e36a940037ac516b0d6412ba44ec6b4f268a55ef1c5ffbf18a2f4e3522bb7b6ed89=
774b79bffa22f7d3102165565642de0d43a955e96a1f2e80e5430671d7266eb4f905dc8ff5e=
106dc5588e5b0289e49a4913940e392a97062616d2bda38155471b7d360cfb94681c702f60e=
d2d4de614ea72bf1c53160e63179f6c5b897b59492bee219108309f0b7b8cb2b136c346a5e9=
8b8b4b8415fb1d713bae067911e3057f1c335b4b7e39101eafd5d28f0189037e4334f4fdb90=
38427b1d119a6702aa8233319cc97d496cc289ae8c956ddc84042659a2d43d6aa22f12b81ab=
884e<br>
&gt; ++Output =3D 1f037dd717b07d3e7f7359<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# negative test with otherwise valid padding but a zero byte at the =
eigth<br>
&gt; ++# byte of padding<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D a7a340675a82c30e22219a55bc07cdf36d47d01834c1834f917f18b517=
419ce9de2a96460e745024436470ed85e94297b283537d52189c406a3f533cb405cc6a9dba4=
6b482ce98b6e3dd52d8fce2237425617e38c11fbc46b61897ef200d01e4f25f5f6c4c5b38cd=
0de38ba11908b86595a8036a08a42a3d05b79600a97ac18ba368a08d6cf6ccb624f6e8002af=
c75599fba4de3d4f3ba7d208391ebe8d21f8282b18e2c10869eb2702e68f9176b42b0ddc9d7=
63f0c86ba0ff92c957aaeab76d9ab8da52ea297ec11d92d770146faa1b300e0f91ef969b53e=
7d2907ffc984e9a9c9d11fb7d6cba91972059b46506b035efec6575c46d7114a6b935864858=
445f<br>
&gt; ++Output =3D 63cb0bf65fc8255dd29e17<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# negative test with an otherwise valid plaintext but with missing s=
eparator<br>
&gt; ++# byte<br>
&gt; ++Decrypt =3D RSA-2048-2<br>
&gt; ++Input =3D 3d1b97e7aa34eaf1f4fc171ceb11dcfffd9a46a5b6961205b10b302818=
c1fcc9f4ec78bf18ea0cee7e9fa5b16fb4c611463b368b3312ac11cf9c06b7cf72b54e28484=
8a508d3f02328c62c2999d0fb60929f81783c7a256891bc2ff4d91df2af96a24fc5701a1823=
af939ce6dbdc510608e3d41eec172ad2d51b9fc61b4217c923cadcf5bac321355ef8be5e5f0=
90cdc2bd0c697d9058247db3ad613fdce87d2955a6d1c948a5160f93da21f731d74137f5d1f=
53a1923adb513d2e6e1589d44cc079f4c6ddd471d38ac82d20d8b1d21f8d65f3b6907086809=
f4123e08d86fb38729585de026a485d8f0e703fd4772f6668febf67df947b82195fa3867e3a=
3065<br>
&gt; ++Output =3D 6f09a0b62699337c497b0b<br>
&gt; ++<br>
&gt; ++# Test vectors for the Bleichenbacher workaround (2049 bit key size)=
<br>
&gt; ++<br>
&gt; ++PrivateKey =3D RSA-2049<br>
&gt; ++-----BEGIN RSA PRIVATE KEY-----<br>
&gt; ++MIIEpQIBAAKCAQEBVfiJVWoXdfHHp3hqULGLwoyemG7eVmfKs5uEEk6Q66dcHbCD<br>
&gt; ++rD5EO7qU3CNWD3XjqBaToqQ73HQm2MTq/mjIXeD+dX9uSbue1EfmAkMIANuwTOsi<br>
&gt; ++5/pXoY0zj7ZgJs20Z+cMwEDn02fvQDx78ePfYkZQCUYx8h6v0vtbyRX/BDeazRES<br>
&gt; ++9zLAtGYHwXjTiiD1LtpQny+cBAXVEGnoDM+UFVTQRwRnUFw89UHqCJffyfQAzssp<br>
&gt; ++j/x1M3LZ9pM68XTMQO2W1GcDFzO5f4zd0/krw6A+qFdsQX8kAHteT3UBEFtUTen6<br>
&gt; ++3N/635jftLsFuBmfP4Ws/ZH3qaCUuaOD9QSQlwIDAQABAoIBAQEZwrP1CnrWFSZ5<br>
&gt; ++1/9RCVisLYym8AKFkvMy1VoWc2F4qOZ/F+cFzjAOPodUclEAYBP5dNCj20nvNEyl<br>
&gt; ++omo0wEUHBNDkIuDOI6aUJcFf77bybhBu7/ZMyLnXRC5NpOjIUAjq6zZYWaIpT6OT<br>
&gt; ++e8Jr5WMy59geLBYO9jXMUoqnvlXmM6cj28Hha6KeUrKa7y+eVlT9wGZrsPwlSsvo<br>
&gt; ++DmOHTw9fAgeC48nc/CUg0MnEp7Y05FA/u0k+Gq/us/iL16EzmHJdrm/jmed1zV1M<br>
&gt; ++8J/IODR8TJjasaSIPM5iBRNhWvqhCmM2jm17ed9BZqsWJznvUVpEAu4eBgHFpVvH<br>
&gt; ++HfDjDt+BAoGBAYj2k2DwHhjZot4pUlPSUsMeRHbOpf97+EE99/3jVlI83JdoBfhP<br>
&gt; ++wN3sdw3wbO0GXIETSHVLNGrxaXVod/07PVaGgsh4fQsxTvasZ9ZegTM5i2Kgg8D4<br>
&gt; ++dlxa1A1agfm73OJSftfpUAjLECnLTKvR+em+38KGyWVSJV2n6rGSF473AoGBAN7H<br>
&gt; ++zxHa3oOkxD0vgBl/If1dRv1XtDH0T+gaHeN/agkf/ARk7ZcdyFCINa3mzF9Wbzll<br>
&gt; ++YTqLNnmMkubiP1LvkH6VZ+NBvrxTNxiWJfu+qx87ez+S/7JoHm71p4SowtePfC2J<br>
&gt; ++qqok0s7b0GaBz+ZcNse/o8W6E1FiIi71wukUyYNhAoGAEgk/OnPK7dkPYKME5FQC<br>
&gt; +++HGrMsjJVbCa9GOjvkNw8tVYSpq7q2n9sDHqRPmEBl0EYehAqyGIhmAONxVUbIsL<br>
&gt; ++ha0m04y0MI9S0H+ZRH2R8IfzndNAONsuk46XrQU6cfvtZ3Xh3IcY5U5sr35lRn2c<br>
&gt; ++ut3H52XIWJ4smN/cJcpOyoECgYEAjM5hNHnPlgj392wkXPkbtJXWHp3mSISQVLTd<br>
&gt; ++G0MW8/mBQg3AlXi/eRb+RpHPrppk5jQLhgMjRSPyXXe2amb8PuWTqfGN6l32PtX3<br>
&gt; ++3+udILpppb71Wf+w7JTbcl9v9uq7o9SVR8DKdPA+AeweSQ0TmqCnlHuNZizOSjwP<br>
&gt; ++G16GF0ECgYEA+ZWbNMS8qM5IiHgbMbHptdit9dDT4+1UXoNn0/hUW6ZEMriHMDXv<br>
&gt; ++iBwrzeANGAn5LEDYeDe1xPms9Is2uNxTpZVhpFZSNALR6Po68wDlTJG2PmzuBv5t<br>
&gt; ++5mbzkpWCoD4fRU53ifsHgaTW+7Um74gWIf0erNIUZuTN2YrtEPTnb3k=3D<br>
&gt; ++-----END RSA PRIVATE KEY-----<br>
&gt; ++<br>
&gt; ++# corresponding public key<br>
&gt; ++PublicKey =3D RSA-2049-PUBLIC<br>
&gt; ++-----BEGIN PUBLIC KEY-----<br>
&gt; ++MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEBVfiJVWoXdfHHp3hqULGL<br>
&gt; ++woyemG7eVmfKs5uEEk6Q66dcHbCDrD5EO7qU3CNWD3XjqBaToqQ73HQm2MTq/mjI<br>
&gt; ++XeD+dX9uSbue1EfmAkMIANuwTOsi5/pXoY0zj7ZgJs20Z+cMwEDn02fvQDx78ePf<br>
&gt; ++YkZQCUYx8h6v0vtbyRX/BDeazRES9zLAtGYHwXjTiiD1LtpQny+cBAXVEGnoDM+U<br>
&gt; ++FVTQRwRnUFw89UHqCJffyfQAzsspj/x1M3LZ9pM68XTMQO2W1GcDFzO5f4zd0/kr<br>
&gt; ++w6A+qFdsQX8kAHteT3UBEFtUTen63N/635jftLsFuBmfP4Ws/ZH3qaCUuaOD9QSQ<br>
&gt; ++lwIDAQAB<br>
&gt; ++-----END PUBLIC KEY-----<br>
&gt; ++<br>
&gt; ++PrivPubKeyPair =3D RSA-2049:RSA-2049-PUBLIC<br>
&gt; ++<br>
&gt; ++# RSA decrypt<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# malformed that generates length specified by 3rd last value from P=
RF<br>
&gt; ++Decrypt =3D RSA-2049<br>
&gt; ++Input =3D 00b26f6404b82649629f2704494282443776929122e279a9cf30b0c6fe=
8122a0a9042870d97cc8ef65490fe58f031eb2442352191f5fbc311026b5147d32df914599f=
38b825ebb824af0d63f2d541a245c5775d1c4b78630e4996cc5fe413d38455a776cf4edcc0a=
a7fccb31c584d60502ed2b77398f536e137ff7ba6430e9258e21c2db5b82f5380f566876110=
ac4c759178900fbad7ab70ea07b1daf7a1639cbb4196543a6cbe8271f35dddb8120304f6eef=
83059e1c5c5678710f904a6d760c4d1d8ad076be17904b9e69910040b47914a0176fb7eea0c=
06444a6c4b86d674d19a556a1de5490373cb01ce31bbd15a5633362d3d2cd7d4af1b4c51212=
88b894<br>
&gt; ++Output =3D 42<br>
&gt; ++<br>
&gt; ++# simple positive test case<br>
&gt; ++Availablein =3D default<br>
&gt; ++Decrypt =3D RSA-2049<br>
&gt; ++Input =3D 013300edbf0bb3571e59889f7ed76970bf6d57e1c89bbb6d1c3991d9df=
8e65ed54b556d928da7d768facb395bbcc81e9f8573b45cf8195dbd85d83a59281cddf4163a=
ec11b53b4140053e3bd109f787a7c3cec31d535af1f50e0598d85d96d91ea01913d07097d25=
af99c67464ebf2bb396fb28a9233e56f31f7e105d71a23e9ef3b736d1e80e713d1691713df9=
7334779552fc94b40dd733c7251bc522b673d3ec9354af3dd4ad44fa71c0662213a57ada1d7=
5149697d0eb55c053aaed5ffd0b815832f454179519d3736fb4faf808416071db0d0f801aca=
8548311ee708c131f4be658b15f6b54256872c2903ac708bd43b017b073b5707bc84c2cd9da=
70e967<br>
&gt; ++Output =3D &quot;lorem ipsum&quot;<br>
&gt; ++<br>
&gt; ++# positive test case with null padded ciphertext<br>
&gt; ++Availablein =3D default<br>
&gt; ++Decrypt =3D RSA-2049<br>
&gt; ++Input =3D 0002aadf846a329fadc6760980303dbd87bfadfa78c2015ce4d6c5782f=
d9d3f1078bd3c0a2c5bfbdd1c024552e5054d98b5bcdc94e476dd280e64d650089326542ce7=
c61d4f1ab40004c2e6a88a883613568556a10f3f9edeab67ae8dddc1e6b0831c2793d2715de=
943f7ce34c5c05d1b09f14431fde566d17e76c9feee90d86a2c158616ec81dda0c642f58c0b=
a8fa4495843124a7235d46fb4069715a51bf710fd024259131ba94da73597ace494856c94e7=
a3ec261545793b0990279b15fa91c7fd13dbfb1df2f221dab9fa9f7c1d21e48aa49f6aaecba=
bf5ee76dc6c2af2317ffb4e303115386a97f8729afc3d0c89419669235f1a3a69570e0836c7=
9fc162<br>
&gt; ++Output =3D &quot;lorem ipsum&quot;<br>
&gt; ++<br>
&gt; ++# positive test case with null truncated ciphertext<br>
&gt; ++Availablein =3D default<br>
&gt; ++Decrypt =3D RSA-2049<br>
&gt; ++Input =3D 02aadf846a329fadc6760980303dbd87bfadfa78c2015ce4d6c5782fd9=
d3f1078bd3c0a2c5bfbdd1c024552e5054d98b5bcdc94e476dd280e64d650089326542ce7c6=
1d4f1ab40004c2e6a88a883613568556a10f3f9edeab67ae8dddc1e6b0831c2793d2715de94=
3f7ce34c5c05d1b09f14431fde566d17e76c9feee90d86a2c158616ec81dda0c642f58c0ba8=
fa4495843124a7235d46fb4069715a51bf710fd024259131ba94da73597ace494856c94e7a3=
ec261545793b0990279b15fa91c7fd13dbfb1df2f221dab9fa9f7c1d21e48aa49f6aaecbabf=
5ee76dc6c2af2317ffb4e303115386a97f8729afc3d0c89419669235f1a3a69570e0836c79f=
c162<br>
&gt; ++Output =3D &quot;lorem ipsum&quot;<br>
&gt; ++<br>
&gt; ++# positive test case with double null padded ciphertext<br>
&gt; ++Availablein =3D default<br>
&gt; ++Decrypt =3D RSA-2049<br>
&gt; ++Input =3D 0000f36da3b72d8ff6ded74e7efd08c01908f3f5f0de7b55eab92b5f87=
5190809c39d4162e1e6649618f854fd84aeab03970d16bb814e999852c06de38d82b95c0f32=
e2a7b5714021fe303389be9c0eac24c90a6b7210f929d390fabf903d44e04110bb7a7fd6c38=
3c275804721efa6d7c93aa64c0bb2b18d97c5220a846c66a4895ae52adddbe2a9996825e013=
585adcec4b32ba61d782737bd343e5fabd68e8a95b8b1340318559860792dd70dffbe05a105=
2b54cbfb48cfa7bb3c19cea52076bddac5c25ee276f153a610f6d06ed696d192d8ae4507ffa=
e4e5bdda10a625d6b67f32f7cffcd48dee2431fe66f6105f9d17e611cdcc674868e81692a36=
0f4052<br>
&gt; ++Output =3D &quot;lorem ipsum&quot;<br>
&gt; ++<br>
&gt; ++# positive test case with double null truncated ciphertext<br>
&gt; ++Availablein =3D default<br>
&gt; ++Decrypt =3D RSA-2049<br>
&gt; ++Input =3D f36da3b72d8ff6ded74e7efd08c01908f3f5f0de7b55eab92b5f875190=
809c39d4162e1e6649618f854fd84aeab03970d16bb814e999852c06de38d82b95c0f32e2a7=
b5714021fe303389be9c0eac24c90a6b7210f929d390fabf903d44e04110bb7a7fd6c383c27=
5804721efa6d7c93aa64c0bb2b18d97c5220a846c66a4895ae52adddbe2a9996825e013585a=
dcec4b32ba61d782737bd343e5fabd68e8a95b8b1340318559860792dd70dffbe05a1052b54=
cbfb48cfa7bb3c19cea52076bddac5c25ee276f153a610f6d06ed696d192d8ae4507ffae4e5=
bdda10a625d6b67f32f7cffcd48dee2431fe66f6105f9d17e611cdcc674868e81692a360f40=
52<br>
&gt; ++Output =3D &quot;lorem ipsum&quot;<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# a random negative test case that generates an 11 byte long message=
<br>
&gt; ++Decrypt =3D RSA-2049<br>
&gt; ++Input =3D 00f910200830fc8fff478e99e145f1474b312e2512d0f90b8cef77f800=
1d09861688c156d1cbaf8a8957f7ebf35f724466952d0524cad48aad4fba1e45ce8ea27e8f3=
ba44131b7831b62d60c0762661f4c1d1a88cd06263a259abf1ba9e6b0b172069afb86a7e883=
87726f8ab3adb30bfd6b3f6be6d85d5dfd044e7ef052395474a9cbb1c3667a92780b43a2269=
3015af6c513041bdaf87d43b24ddd244e791eeaea1066e1f4917117b3a468e22e0f7358852b=
b981248de4d720add2d15dccba6280355935b67c96f9dcb6c419cc38ab9f6fba2d649ef2066=
e0c34c9f788ae49babd9025fa85b21113e56ce4f43aa134c512b030dd7ac7ce82e76f0be9ce=
09ebca<br>
&gt; ++Output =3D 1189b6f5498fd6df532b00<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# otherwise correct plaintext, but with wrong first byte (0x01 inste=
ad of 0x00)<br>
&gt; ++Decrypt =3D RSA-2049<br>
&gt; ++Input =3D 002c9ddc36ba4cf0038692b2d3a1c61a4bb3786a97ce2e46a3ba74d031=
58aeef456ce0f4db04dda3fe062268a1711250a18c69778a6280d88e133a16254e1f0e30ce8=
dac9b57d2e39a2f7d7be3ee4e08aec2fdbe8dadad7fdbf442a29a8fb40857407bf6be35596b=
8eefb5c2b3f58b894452c2dc54a6123a1a38d642e23751746597e08d71ac92704adc17803b1=
9e131b4d1927881f43b0200e6f95658f559f912c889b4cd51862784364896cd6e8618f485a9=
92f82997ad6a0917e32ae5872eaf850092b2d6c782ad35f487b79682333c1750c685d7d32ab=
3e1538f31dcaa5e7d5d2825875242c83947308dcf63ba4bfff20334c9c140c837dbdbae7a8d=
ee72ff<br>
&gt; ++Output =3D f6d0f5b78082fe61c04674<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# otherwise correct plaintext, but with wrong second byte (0x01 inst=
ead of 0x02)<br>
&gt; ++Decrypt =3D RSA-2049<br>
&gt; ++Input =3D 00c5d77826c1ab7a34d6390f9d342d5dbe848942e2618287952ba0350d=
7de6726112e9cebc391a0fae1839e2bf168229e3e0d71d4161801509f1f28f6e1487ca52df0=
5c466b6b0a6fbbe57a3268a970610ec0beac39ec0fa67babce1ef2a86bf77466dc127d7d0d2=
962c20e66593126f276863cd38dc6351428f884c1384f67cad0a0ffdbc2af16711fb68dc559=
b96b37b4f04cd133ffc7d79c43c42ca4948fa895b9daeb853150c8a5169849b730cc77d68b0=
217d6c0e3dbf38d751a1998186633418367e7576530566c23d6d4e0da9b038d0bb5169ce401=
33ea076472d055001f0135645940fd08ea44269af2604c8b1ba225053d6db9ab43577689401=
bdc0f3<br>
&gt; ++Output =3D 1ab287fcef3ff17067914d<br>
&gt; ++<br>
&gt; ++# RSA decrypt with 3072 bit keys<br>
&gt; ++PrivateKey =3D RSA-3072<br>
&gt; ++-----BEGIN RSA PRIVATE KEY-----<br>
&gt; ++MIIG5AIBAAKCAYEAr9ccqtXp9bjGw2cHCkfxnX5mrt4YpbJ0H7PE0zQ0VgaSotkJ<br>
&gt; ++72iI7GAv9rk68ljudDA8MBr81O2+xDMR3cjdvwDdu+OG0zuNDiKxtEk23EiYcbhS<br>
&gt; ++N7NM50etj9sMTk0dqnqt8HOFxchzLMt9Wkni5QyIPH16wQ7Wp02ayQ35EpkFoX1K<br>
&gt; ++CHIQ/Hi20EseuWlILBGm7recUOWxbz8lT3VxUosvFxargW1uygcnveqYBZMpcw64<br>
&gt; ++wzznHWHdSsOTtiVuB6wdEk8CANHD4FpMG8fx7S/IPlcZnP5ZCLEAh+J/vZfSwkIU<br>
&gt; ++YZxxR8j778o5vCVnYqaCNTH34jTWjq56DZ+vEN0V6VI3gMfVrlgJStUlqQY7TDP5<br>
&gt; ++XhAG2i6xLTdDaJSVwfICPkBzU8XrPkyhxIz/gaEJANFIIOuAGvTxpZbEuc6aUx/P<br>
&gt; ++ilTZ/9ckJYtu7CAQjfb9/XbUrgO6fqWY3LDkooCElYcob01/JWzoXl61Z5sdrMH5<br>
&gt; ++CVZJty5foHKusAN5AgMBAAECggGAJRfqyzr+9L/65gOY35lXpdKhVKgzaNjhWEKy<br>
&gt; ++9Z7gn3kZe9LvHprdr4eG9rQSdEdAXjBCsh8vULeqc3cWgMO7y2wiWl1f9rVsRxwY<br>
&gt; ++gqCjOwrxZaPtbCSdx3g+a8dYrDfmVy0z/jJQeO2VJlDy65YEkC75mlEaERnRPE/J<br>
&gt; ++pDoXXc37+xoUAP4XCTtpzTzbiV9lQy6iGV+QURxzNrWKaF2s/y2vTF6S5WWxZlrm<br>
&gt; ++DlErqplluAjV/xGc63zWksv5IAZ6+s2An2a+cG2iaBCseQ2xVslI5v5YG8mEkVf0<br>
&gt; ++2kk/OmSwxuEZ4DGxB/hDbOKRYLRYuPnxCV/esZJjOE/1OHVXvE8QtANN6EFwO60s<br>
&gt; ++HnacI4U+tjCjbRBh3UbipruvdDqX8LMsNvUMGjci3vOjlNkcLgeL8J15Xs3l5WuC<br>
&gt; ++Avl0Am91/FbpoN1qiPLny3jvEpjMbGUgfKRb03GIgHtPzbHmDdjluFZI+376i2/d<br>
&gt; ++RI85dBqNmAn+Fjrz3kW6wkpahByBAoHBAOSj2DDXPosxxoLidP/J/RKsMT0t0FE9<br>
&gt; ++UFcNt+tHYv6hk+e7VAuUqUpd3XQqz3P13rnK4xvSOsVguyeU/WgmH4ID9XGSgpBP<br>
&gt; ++Rh6s7izn4KAJeqfI26vTPxvyaZEqB4JxT6k7SerENus95zSn1v/f2MLBQ16EP8cJ<br>
&gt; +++QSOVCoZfEhUK+srherQ9eZKpj0OwBUrP4VhLdymv96r8xddWX1AVj4OBi2RywKI<br>
&gt; ++gAgv6fjwkb292jFu6x6FjKRNKwKK6c3jqQKBwQDE4c0Oz0KYYV4feJun3iL9UJSv<br>
&gt; ++StGsKVDuljA4WiBAmigMZTii/u0DFEjibiLWcJOnH53HTr0avA6c6D1nCwJ2qxyF<br>
&gt; ++rHNN2L+cdMx/7L1zLR11+InvRgpIGbpeGwHeIzJVUYG3b6llRJMZimBvAMr9ipM1<br>
&gt; ++bkVvIjt1G9W1ypeuKzm6d/t8F0yC7AIYZWDV4nvxiiY8whLZzGawHR2iZz8pfUwb<br>
&gt; ++7URbTvxdsGE27Kq9gstU0PzEJpnU1goCJ7/gA1ECgcBA8w5B6ZM5xV0H5z6nPwDm<br>
&gt; ++IgYmw/HucgV1hU8exfuoK8wxQvTACW4B0yJKkrK11T1899aGG7VYRn9D4j4OLO48<br>
&gt; ++Z9V8esseJXbc1fEezovvymGOci984xiFXtqAQzk44+lmQJJh33VeZApe2eLocvVH<br>
&gt; ++ddEmc1kOuJWFpszf3LeCcG69cnKrXsrLrZ8Frz//g3aa9B0sFi5hGeWHWJxISVN2<br>
&gt; ++c1Nr9IN/57i/GqVTcztjdCAcdM7Tr8phDg7OvRlnxGkCgcEAuYhMFBuulyiSaTff<br>
&gt; ++/3ZvJKYOJ45rPkEFGoD/2ercn+RlvyCYGcoAEjnIYVEGlWwrSH+b0NlbjVkQsD6O<br>
&gt; ++to8CeE/RpgqX8hFCqC7NE/RFp8cpDyXy3j/zqnRMUyhCP1KNuScBBZs9V8gikxv6<br>
&gt; ++ukBWCk3PYbeTySHKRBbB8vmCrMfhM96jaBIQsQO1CcZnVceDo1/bnsAIwaREVMxr<br>
&gt; ++Q8LmG7QOx/Z0x1MMsUFoqzilwccC09/JgxMZPh+h+Nv6jiCxAoHBAOEqQgFAfSdR<br>
&gt; ++ya60LLH55q803NRFMamuKiPbVJLzwiKfbjOiiopmQOS/LxxqIzeMXlYV4OsSvxTo<br>
&gt; ++G7mcTOFRtU5hKCK+t8qeQQpa/dsMpiHllwArnRyBjIVgL5lFKRpHUGLsavU/T1IH<br>
&gt; ++mtgaxZo32dXvcAh1+ndCHVBwbHTOF4conA+g+Usp4bZSSWn5nU4oIizvSVpG7SGe<br>
&gt; ++0GngdxH9Usdqbvzcip1EKeHRTZrHIEYmB+x0LaRIB3dwZNidK3TkKw=3D=3D<br>
&gt; ++-----END RSA PRIVATE KEY-----<br>
&gt; ++<br>
&gt; ++PublicKey =3D RSA-3072-PUBLIC<br>
&gt; ++-----BEGIN PUBLIC KEY-----<br>
&gt; ++MIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAr9ccqtXp9bjGw2cHCkfx<br>
&gt; ++nX5mrt4YpbJ0H7PE0zQ0VgaSotkJ72iI7GAv9rk68ljudDA8MBr81O2+xDMR3cjd<br>
&gt; ++vwDdu+OG0zuNDiKxtEk23EiYcbhSN7NM50etj9sMTk0dqnqt8HOFxchzLMt9Wkni<br>
&gt; ++5QyIPH16wQ7Wp02ayQ35EpkFoX1KCHIQ/Hi20EseuWlILBGm7recUOWxbz8lT3Vx<br>
&gt; ++UosvFxargW1uygcnveqYBZMpcw64wzznHWHdSsOTtiVuB6wdEk8CANHD4FpMG8fx<br>
&gt; ++7S/IPlcZnP5ZCLEAh+J/vZfSwkIUYZxxR8j778o5vCVnYqaCNTH34jTWjq56DZ+v<br>
&gt; ++EN0V6VI3gMfVrlgJStUlqQY7TDP5XhAG2i6xLTdDaJSVwfICPkBzU8XrPkyhxIz/<br>
&gt; ++gaEJANFIIOuAGvTxpZbEuc6aUx/PilTZ/9ckJYtu7CAQjfb9/XbUrgO6fqWY3LDk<br>
&gt; ++ooCElYcob01/JWzoXl61Z5sdrMH5CVZJty5foHKusAN5AgMBAAE=3D<br>
&gt; ++-----END PUBLIC KEY-----<br>
&gt; ++<br>
&gt; ++PrivPubKeyPair =3D RSA-3072:RSA-3072-PUBLIC<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# a random invalid ciphertext that generates an empty synthethic one=
<br>
&gt; ++Decrypt =3D RSA-3072<br>
&gt; ++Input =3D 5e956cd9652f4a2ece902931013e09662b6a9257ad1e987fb75f73a060=
6df2a4b04789770820c2e02322c4e826f767bd895734a01e20609c3be4517a7a2a589ea1cdc=
137beb73eb38dac781b52e863de9620f79f9b90fd5b953651fcbfef4a9f1cc07421d511a87d=
d6942caab6a5a0f4df473e62defb529a7de1509ab99c596e1dff1320402298d8be73a896cc8=
6c38ae3f2f576e9ea70cc28ad575cb0f854f0be43186baa9c18e29c47c6ca77135db79c8112=
31b7c1730955887d321fdc06568382b86643cf089b10e35ab23e827d2e5aa7b4e99ff2e914f=
302351819eb4d1693243b35f8bf1d42d08f8ec4acafa35f747a4a975a28643ec630d8e4fa5b=
e59d81995660a14bb64c1fea5146d6b11f92da6a3956dd5cb5e0d747cf2ea23f81617769185=
336263d46ef4c144b754de62a6337342d6c85a95f19f015724546ee3fc4823eca603dbc1dc0=
1c2d5ed50bd72d8e96df2dc048edde0081284068283fc5e73a6139851abf2f29977d0b3d160=
c883a42a37efba1be05c1a0b1741d7ddf59<br>
&gt; ++Output =3D<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# a random invalid that has PRF output with a length one byte too lo=
ng<br>
&gt; ++# in the last value<br>
&gt; ++Decrypt =3D RSA-3072<br>
&gt; ++Input =3D 7db0390d75fcf9d4c59cf27b264190d856da9abd11e92334d0e5f71005=
cfed865a711dfa28b791188374b61916dbc11339bf14b06f5f3f68c206c5607380e13da3129=
bfb744157e1527dd6fdf6651248b028a496ae1b97702d44706043cdaa7a59c0f41367303f21=
f268968bf3bd2904db3ae5239b55f8b438d93d7db9d1666c071c0857e2ec37757463769c54e=
51f052b2a71b04c2869e9e7049a1037b8429206c99726f07289bac18363e7eb2a5b417f47c3=
7a55090cda676517b3549c873f2fe95da9681752ec9864b069089a2ed2f340c8b04ee000790=
55a817a3355b46ac7dc00d17f4504ccfbcfcadb0c04cb6b22069e179385ae1eafabad5521ba=
c2b8a8ee1dfff59a22eb3fdacfc87175d10d7894cfd869d056057dd9944b869c1784fcc27f7=
31bc46171d39570fbffbadf082d33f6352ecf44aca8d9478e53f5a5b7c852b401e8f5f74da4=
9da91e65bdc97765a9523b7a0885a6f8afe5759d58009fbfa837472a968e6ae92026a5e0202=
a395483095302d6c3985b5f5831c521a271<br>
&gt; ++Output =3D 56a3bea054e01338be9b7d7957539c<br>
&gt; ++<br>
&gt; ++Availablein =3D default<br>
&gt; ++# a random invalid that generates a synthethic of maximum size<br>
&gt; ++Decrypt =3D RSA-3072<br>
&gt; ++Input =3D 1715065322522dff85049800f6a29ab5f98c465020467414b2a44127fe=
9446da47fa18047900f99afe67c2df6f50160bb8e90bff296610fde632b3859d4d0d2e644f2=
3835028c46cca01b84b88231d7e03154edec6627bcba23de76740d839851fa12d74c8f92e54=
0c73fe837b91b7d699b311997d5f0f7864c486d499c3a79c111faaacbe4799597a25066c620=
0215c3d158f3817c1aa57f18bdaad0be1658da9da93f5cc6c3c4dd72788af57adbb6a0c26f4=
2d32d95b8a4f95e8c6feb2f8a5d53b19a50a0b7cbc25e055ad03e5ace8f3f7db13e57759f67=
b65d143f08cca15992c6b2aae643390483de111c2988d4e76b42596266005103c8de6044fb7=
398eb3c28a864fa672de5fd8774510ff45e05969a11a4c7d3f343e331190d2dcf24fb9154ba=
904dc94af98afc5774a9617d0418fe6d13f8245c7d7626c176138dd698a23547c25f27c2b98=
ea4d8a45c7842b81888e4cc14e5b72e9cf91f56956c93dbf2e5f44a8282a7813157fc481ff1=
371a0f66b31797e81ebdb09a673d4db96d6<br>
&gt; ++Output =3D 7b036fcd6243900e4236c894e2462c17738acc87e01a76f4d95cb9a32=
8d9acde81650283b8e8f60a217e3bdee835c7b222ad4c85d0acdb9a309bd2a754609a65dec5=
0f3aa04c6d5891034566b9563d42668ede1f8992b17753a2132e28970584e255efc8b45a41c=
5dbd7567f014acec5fe6fdb6d484790360a913ebb9defcd74ff377f2a8ba46d2ed85f733c9a=
3da08eb57ecedfafda806778f03c66b2c5d2874cec1c291b2d49eb194c7b5d0dd2908ae90f4=
843268a2c45563092ade08acb6ab481a08176102fc803fbb2f8ad11b0e1531bd37df543498d=
af180b12017f4d4d426ca29b4161075534bfb914968088a9d13785d0adc0e2580d3548494b2=
a9e91605f2b27e6cc701c796f0de7c6f471f6ab6cb9272a1ed637ca32a60d117505d82af3c1=
336104afb537d01a8f70b510e1eebf4869cb976c419473795a66c7f5e6e20a8094b1bb603a7=
4330c537c5c0698c31538bd2e138c1275a1bdf24c5fa8ab3b7b526324e7918a382d1363b3d4=
63764222150e04<br>
&gt; ++<br>
&gt; ++# a positive test case that decrypts to 9 byte long value<br>
&gt; ++Availablein =3D default<br>
&gt; ++Decrypt =3D RSA-3072<br>
&gt; ++Input =3D 6c60845a854b4571f678941ae35a2ac03f67c21e21146f9db1f2306be9=
f136453b86ad55647d4f7b5c9e62197aaff0c0e40a3b54c4cde14e774b1c5959b6c2a230289=
6ffae1f73b00b862a20ff4304fe06cea7ff30ecb3773ca9af27a0b54547350d7c07dfb0a396=
29c7e71e83fc5af9b2adbaf898e037f1de696a3f328cf45af7ec9aff7173854087fb8fbf34b=
e981efbd8493f9438d1b2ba2a86af082662aa46ae9adfbec51e5f3d9550a4dd1dcb7c8969c9=
587a6edc82a8cabbc785c40d9fbd12064559fb769450ac3e47e87bc046148130d7eaa843e4b=
3ccef3675d0630500803cb7ffee3882378c1a404e850c3e20707bb745e42b13c18786c49760=
76ed9fa8fd0ff15e571bef02cbbe2f90c908ac3734a433b73e778d4d17fcc28f49185ebc6e8=
536a06d293202d94496453bfdf1c2c7833a3f99fa38ca8a81f42eaa529d603b890308a319c0=
ab63a35ff8ebac965f6278f5a7e5d622be5d5fe55f0ca3ec993d55430d2bf59c5d3e860e90c=
16d91a04596f6fdf60d89ed95d88c036dde<br>
&gt; ++Output =3D &quot;forty two&quot;<br>
&gt; ++<br>
&gt; ++# a positive test case with null padded ciphertext<br>
&gt; ++Availablein =3D default<br>
&gt; ++Decrypt =3D RSA-3072<br>
&gt; ++Inpu</blockquote></div></div>

--00000000000040bb49063aaf1d69--

