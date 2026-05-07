Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B931CD343F
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 23:01:42 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1721.1778194893472950923
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 16:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JBeJ4Og4;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso8844375e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 16:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778194892; x=1778799692; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpGVRIqGFa0M8zzu8DzyTR65kqCS2cITULBKgrWOT8w=;
        b=JBeJ4Og4Ju3Vjm5c1YTOZuqQx3mm0Vw4EV8Nt+CrzQ7NygXch2MMblaTRwx3I86r3U
         6e6C0/pZghCHA/gSkoumpzMUmCOt1A+VcmlKgQCuZBarND8VkAngMlGMr1x7RcfIuUNq
         OeSJzDGRXZ29sEU0eR1tml4MBgpv/ELcK/YuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194892; x=1778799692;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XpGVRIqGFa0M8zzu8DzyTR65kqCS2cITULBKgrWOT8w=;
        b=fixgZVZ9m003W/BaQvIpJzeWrBwqpxIitc7UBcnXdSpt7gpYTWdMjxvj9CDFfCsM9/
         o67FTWmsDJ80EnNeMD4K8JQPi9/nWjukuyGRG42sLETdV8eqgRN3SgrGQ+TLPj/ucVZ3
         JqVthDUP6ArKw0X2Mw/hthb74SLuMqxf+fWE2bqAuMgWIaVYevPYHRtmV1tL1C8rtVzY
         Uu3iUm5+beT2EdvVoqWg3B8DYwOVXEd6//69SsqQqJyhPlhjHsgrMMioBpYGXhh20rXU
         m1ounyRx/33FkUOS27nXT8EmoLDUap+/Wcai1GsCRnAymSHAFGfTE/ZY2Fx72WYKAt4K
         Eghg==
X-Forwarded-Encrypted: i=1; AFNElJ/qM22Ik5tuvv8w93vHB3uK1ScMacgZszMucuh30MqugAL5KvaBNkdOjL9kxGZA54kWKmW9aUMSCaHiOAVAHCWg4w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwPS8KrsIJ14fQBIcleLfP9T8YK2RfVfLRAZ727azlyI7+mqUx1
	pL93cpFk7rrj7pvoTTZw+i2wf73J0Ia5dVnTyFwwF+GXQ9hwcfuS+yq0QUXoo2QuV7DKXcj6Xtw
	g9yL23+I=
X-Gm-Gg: AeBDietHb/ZoIR/TVS/AS2KTbknrIN8jsnGqHhntkJqwtsZ8To+ByY0vOP5RDpmapxG
	huBhVC9NS2vKVZfHAC5B83AIbNGKXLgT1vD2ltJXZrFVb4yQTackyZR3OIrtQWFw7W2WfmdfzJe
	7YW1ha8AoRQQqQJ7dPu6rD+tkS2OtHqBHg8+bL3nTD7p2GlIu7savaKKk2BTTXg2swp/LfoDVaK
	mMrhOtZEvCGm52/aLq9m5reekRrYQ4Aq3C3Xspu4kQJfzmim6xdlfVcl/5bL+BUijeUnFskAG/d
	RkBTUq3fRPDIyrG/+XYW8jT7kUQ3/deMPfCyrqxdz/MxuFJWyZqRjAl9rnew1M11OVmUmurHI4j
	RZ7pi3o/ICkuRmb7Cq6Li9NPtN29g29b2QHQnPPe6ELuW3tWxCi7I7zS9c+6Z4babPRKww+1yv8
	Tr2+NWa2tddfHzD+6u8yfKNTU18xYmg4/SR184BlKY28euNqa2CrvIMCNLkB+wVMPcRcDqw2srh
	LKytKV6EmqBSb0=
X-Received: by 2002:a05:600c:3f0b:b0:48a:6fd4:d3d3 with SMTP id 5b1f17b1804b1-48e51f37fb8mr198644935e9.20.1778194891616;
        Thu, 07 May 2026 16:01:31 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4541712368esm2191329f8f.26.2026.05.07.16.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 16:01:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 May 2026 01:01:30 +0200
Message-Id: <DICTHBF30UIC.SLD2UTBGTJVU@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 09/12] python3-pyasn1: fix
 CVE-2026-30922
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>, "Wang, Jinfeng
 (CN)" <Jinfeng.Wang.CN@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
 <20260409061639.1688205-10-jinfeng.wang.cn@windriver.com>
 <DI17NNT0X7YI.3HOA397O2P5FL@smile.fr>
 <IA4PR11MB942062CFC3DECE261B819667B8362@IA4PR11MB9420.namprd11.prod.outlook.com>
In-Reply-To: <IA4PR11MB942062CFC3DECE261B819667B8362@IA4PR11MB9420.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 23:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236627

On Mon Apr 27, 2026 at 8:04 AM CEST, Jiaying (CN) Song wrote:
> Hi Yoann,=20
>
> This patch is for scarthgap where pyasn1 is at 0.5.1. The 0.6.2 -> 0.6.3 =
upgrade would only apply to master. According to https://github.com/pyasn1/=
pyasn1/security/advisories/GHSA-jr27-m4p2-rc6r ,=20
> all versions <=3D 0.6.2 are affected, so for scarthgap, this patch is sti=
ll needed to fix the CVE.

Yes, agreed but the trouble was that is was not fixed on master and,
therefore, could not be fixed on scarthgap.

Now the situation has changed, it is fixed on master by upgrading to
0.6.3 but wrynose is now vulnerable.
Can you send a fix to wrynose? I can't merge a fix to scarthgap without
one for wrynose.

Thanks!

>
> Best regards,
> Jiaying.
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Yoann Congal via lists.openembedded.org
> Sent: Friday, April 24, 2026 3:36 PM
> To: Wang, Jinfeng (CN) <Jinfeng.Wang.CN@windriver.com>; openembedded-core=
@lists.openembedded.org
> Subject: Re: [OE-core] [scarthgap][PATCH 09/12] python3-pyasn1: fix CVE-2=
026-30922
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On Thu Apr 9, 2026 at 8:16 AM CEST, Jinfeng (CN) via lists.openembedded.o=
rg Wang wrote:
>> From: Jiaying Song <jiaying.song.cn@windriver.com>
>>
>> pyasn1 is a generic ASN.1 library for Python. Prior to 0.6.3, the=20
>> `pyasn1` library is vulnerable to a Denial of Service (DoS) attack=20
>> caused by uncontrolled recursion when decoding ASN.1 data with deeply=20
>> nested structures. An attacker can supply a crafted payload containing=
=20
>> thousands of nested `SEQUENCE` (`0x30`) or `SET` (`0x31`) tags with=20
>> "Indefinite Length" (`0x80`) markers. This forces the decoder to=20
>> recursively call itself until the Python interpreter crashes with a=20
>> `RecursionError` or consumes all available memory (OOM), crashing the=20
>> host application. This is a distinct vulnerability from CVE-2026-23490=
=20
>> (which addressed integer overflows in OID decoding). The fix for
>> CVE-2026-23490 (`MAX_OID_ARC_CONTINUATION_OCTETS`) does not mitigate=20
>> this recursion issue. Version 0.6.3 fixes this specific issue.
>>
>> References:
>> https://nvd.nist.gov/vuln/detail/CVE-2026-30922
>>
>> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
>> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>> ---
>
> AFAIK, this CVE also apply to master (I'm not sure why it does not appear=
 on https://valkyrie.yocto.io/pub/non-release/patchmetrics/)
>
> I'll hold this patch until "python3-pyasn1: upgrade 0.6.2 -> 0.6.3"
> merges.
>
>>  .../recipes-devtools/python/python-pyasn1.inc |   1 +
>>  .../python3-pyasn1/CVE-2026-30922.patch       | 257 ++++++++++++++++++
>>  2 files changed, 258 insertions(+)
>>  create mode 100644=20
>> meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch
>>
>> diff --git a/meta/recipes-devtools/python/python-pyasn1.inc=20
>> b/meta/recipes-devtools/python/python-pyasn1.inc
>> index 96b4a3b52a..d69cdf8877 100644
>> --- a/meta/recipes-devtools/python/python-pyasn1.inc
>> +++ b/meta/recipes-devtools/python/python-pyasn1.inc
>> @@ -19,6 +19,7 @@ inherit ptest
>>  SRC_URI +=3D " \
>>         file://run-ptest \
>>         file://CVE-2026-23490.patch \
>> +       file://CVE-2026-30922.patch \
>>  "
>>
>>  RDEPENDS:${PN}-ptest +=3D " \
>> diff --git=20
>> a/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch=20
>> b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch
>> new file mode 100644
>> index 0000000000..7eceaa2595
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3-pyasn1/CVE-2026-30922.patch
>> @@ -0,0 +1,257 @@
>> +From 85e901d1dacdcd17363cc2dd18a91cfb72363eeb Mon Sep 17 00:00:00=20
>> +2001
>> +From: Simon Pichugin <simon.pichugin@gmail.com>
>> +Date: Thu, 19 Mar 2026 17:11:40 +0800
>> +Subject: [PATCH] Merge commit from fork
>> +
>> +CVE: CVE-2026-30922
>> +
>> +Upstream-Status: Backport=20
>> +[https://github.com/pyasn1/pyasn1/commit/25ad481c19]
>> +
>> +Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
>> +---
>> + pyasn1/codec/ber/decoder.py     |  10 +++
>> + tests/codec/ber/test_decoder.py | 114=20
>> +++++++++++++++++++++++++++++++++  tests/codec/cer/test_decoder.py | =20
>> +22 ++++++  tests/codec/der/test_decoder.py |  40 +++++++++++
>> + 4 files changed, 186 insertions(+)
>> +
>> +diff --git a/pyasn1/codec/ber/decoder.py=20
>> +b/pyasn1/codec/ber/decoder.py index be8ba65..da2a048 100644
>> +--- a/pyasn1/codec/ber/decoder.py
>> ++++ b/pyasn1/codec/ber/decoder.py
>> +@@ -38,6 +38,7 @@ SubstrateUnderrunError =3D=20
>> +error.SubstrateUnderrunError  # Maximum number of continuation octets (=
high-bit set) allowed per OID arc.
>> + # 20 octets allows up to 140-bit integers, supporting UUID-based=20
>> +OIDs  MAX_OID_ARC_CONTINUATION_OCTETS =3D 20
>> ++MAX_NESTING_DEPTH =3D 100
>> +
>> +
>> + class AbstractPayloadDecoder(object):
>> +@@ -1515,6 +1516,15 @@ class SingleItemDecoder(object):
>> +                  decodeFun=3DNone, substrateFun=3DNone,
>> +                  **options):
>> +
>> ++        _nestingLevel =3D options.get('_nestingLevel', 0)
>> ++
>> ++        if _nestingLevel > MAX_NESTING_DEPTH:
>> ++            raise error.PyAsn1Error(
>> ++                'ASN.1 structure nesting depth exceeds limit (%d)' % M=
AX_NESTING_DEPTH
>> ++            )
>> ++
>> ++        options['_nestingLevel'] =3D _nestingLevel + 1
>> ++
>> +         allowEoo =3D options.pop('allowEoo', False)
>> +
>> +         if LOG:
>> +diff --git a/tests/codec/ber/test_decoder.py=20
>> +b/tests/codec/ber/test_decoder.py index f033dfd..226381a 100644
>> +--- a/tests/codec/ber/test_decoder.py
>> ++++ b/tests/codec/ber/test_decoder.py
>> +@@ -1987,6 +1987,120 @@ class CompressedFilesTestCase(BaseTestCase):
>> +         finally:
>> +             os.remove(path)
>> +
>> ++class NestingDepthLimitTestCase(BaseTestCase):
>> ++    """Test protection against deeply nested ASN.1 structures (CVE pre=
vention)."""
>> ++
>> ++    def testIndefLenSequenceNesting(self):
>> ++        """Deeply nested indefinite-length SEQUENCEs must raise PyAsn1=
Error."""
>> ++        # Each \x30\x80 opens a new indefinite-length SEQUENCE
>> ++        payload =3D b'\x30\x80' * 200
>> ++        try:
>> ++            decoder.decode(payload)
>> ++        except error.PyAsn1Error:
>> ++            pass
>> ++        else:
>> ++            assert False, 'Deeply nested indef-length SEQUENCEs not re=
jected'
>> ++
>> ++    def testIndefLenSetNesting(self):
>> ++        """Deeply nested indefinite-length SETs must raise PyAsn1Error=
."""
>> ++        # Each \x31\x80 opens a new indefinite-length SET
>> ++        payload =3D b'\x31\x80' * 200
>> ++        try:
>> ++            decoder.decode(payload)
>> ++        except error.PyAsn1Error:
>> ++            pass
>> ++        else:
>> ++            assert False, 'Deeply nested indef-length SETs not rejecte=
d'
>> ++
>> ++    def testDefiniteLenNesting(self):
>> ++        """Deeply nested definite-length SEQUENCEs must raise PyAsn1Er=
ror."""
>> ++        inner =3D b'\x05\x00'  # NULL
>> ++        for _ in range(200):
>> ++            length =3D len(inner)
>> ++            if length < 128:
>> ++                inner =3D b'\x30' + bytes([length]) + inner
>> ++            else:
>> ++                length_bytes =3D length.to_bytes(
>> ++                    (length.bit_length() + 7) // 8, 'big')
>> ++                inner =3D b'\x30' + bytes([0x80 | len(length_bytes)]) =
+ \
>> ++                    length_bytes + inner
>> ++        try:
>> ++            decoder.decode(inner)
>> ++        except error.PyAsn1Error:
>> ++            pass
>> ++        else:
>> ++            assert False, 'Deeply nested definite-length SEQUENCEs not=
 rejected'
>> ++
>> ++    def testNestingUnderLimitWorks(self):
>> ++        """Nesting within the limit must decode successfully."""
>> ++        inner =3D b'\x05\x00'  # NULL
>> ++        for _ in range(50):
>> ++            length =3D len(inner)
>> ++            if length < 128:
>> ++                inner =3D b'\x30' + bytes([length]) + inner
>> ++            else:
>> ++                length_bytes =3D length.to_bytes(
>> ++                    (length.bit_length() + 7) // 8, 'big')
>> ++                inner =3D b'\x30' + bytes([0x80 | len(length_bytes)]) =
+ \
>> ++                    length_bytes + inner
>> ++        asn1Object, _ =3D decoder.decode(inner)
>> ++        assert asn1Object is not None, 'Valid nested structure rejecte=
d'
>> ++
>> ++    def testSiblingsDontIncreaseDepth(self):
>> ++        """Sibling elements at the same level must not inflate depth c=
ount."""
>> ++        # SEQUENCE containing 200 INTEGER siblings - should decode fin=
e
>> ++        components =3D b'\x02\x01\x01' * 200  # 200 x INTEGER(1)
>> ++        length =3D len(components)
>> ++        length_bytes =3D length.to_bytes(
>> ++            (length.bit_length() + 7) // 8, 'big')
>> ++        payload =3D b'\x30' + bytes([0x80 | len(length_bytes)]) + \
>> ++            length_bytes + components
>> ++        asn1Object, _ =3D decoder.decode(payload)
>> ++        assert asn1Object is not None, 'Siblings incorrectly rejected'
>> ++
>> ++    def testErrorMessageContainsLimit(self):
>> ++        """Error message must indicate the nesting depth limit."""
>> ++        payload =3D b'\x30\x80' * 200
>> ++        try:
>> ++            decoder.decode(payload)
>> ++        except error.PyAsn1Error as exc:
>> ++            assert 'nesting depth' in str(exc).lower(), \
>> ++                'Error message missing depth info: %s' % exc
>> ++        else:
>> ++            assert False, 'Expected PyAsn1Error'
>> ++
>> ++    def testNoRecursionError(self):
>> ++        """Must raise PyAsn1Error, not RecursionError."""
>> ++        payload =3D b'\x30\x80' * 50000
>> ++        try:
>> ++            decoder.decode(payload)
>> ++        except error.PyAsn1Error:
>> ++            pass
>> ++        except RecursionError:
>> ++            assert False, 'Got RecursionError instead of PyAsn1Error'
>> ++
>> ++    def testMixedNesting(self):
>> ++        """Mixed SEQUENCE and SET nesting must be caught."""
>> ++        # Alternate SEQUENCE (0x30) and SET (0x31) with indef length
>> ++        payload =3D b''
>> ++        for i in range(200):
>> ++            payload +=3D b'\x30\x80' if i % 2 =3D=3D 0 else b'\x31\x80=
'
>> ++        try:
>> ++            decoder.decode(payload)
>> ++        except error.PyAsn1Error:
>> ++            pass
>> ++        else:
>> ++            assert False, 'Mixed nesting not rejected'
>> ++
>> ++    def testWithSchema(self):
>> ++        """Deeply nested structures must be caught even with schema.""=
"
>> ++        payload =3D b'\x30\x80' * 200
>> ++        try:
>> ++            decoder.decode(payload, asn1Spec=3Duniv.Sequence())
>> ++        except error.PyAsn1Error:
>> ++            pass
>> ++        else:
>> ++            assert False, 'Deeply nested with schema not rejected'
>> +
>> + class NonStreamingCompatibilityTestCase(BaseTestCase):
>> +     def setUp(self):
>> +diff --git a/tests/codec/cer/test_decoder.py=20
>> +b/tests/codec/cer/test_decoder.py index 133affd..fbb1145 100644
>> +--- a/tests/codec/cer/test_decoder.py
>> ++++ b/tests/codec/cer/test_decoder.py
>> +@@ -363,6 +363,28 @@ class SequenceDecoderWithExplicitlyTaggedSetOfOpen=
TypesTestCase(BaseTestCase):
>> +         assert s[0] =3D=3D 3
>> +         assert s[1][0] =3D=3D univ.OctetString(hexValue=3D'02010C')
>> +
>> ++class NestingDepthLimitTestCase(BaseTestCase):
>> ++    """Test CER decoder protection against deeply nested structures.""=
"
>> ++
>> ++    def testIndefLenNesting(self):
>> ++        """Deeply nested indefinite-length SEQUENCEs must raise PyAsn1=
Error."""
>> ++        payload =3D b'\x30\x80' * 200
>> ++        try:
>> ++            decoder.decode(payload)
>> ++        except PyAsn1Error:
>> ++            pass
>> ++        else:
>> ++            assert False, 'Deeply nested indef-length SEQUENCEs not re=
jected'
>> ++
>> ++    def testNoRecursionError(self):
>> ++        """Must raise PyAsn1Error, not RecursionError."""
>> ++        payload =3D b'\x30\x80' * 50000
>> ++        try:
>> ++            decoder.decode(payload)
>> ++        except PyAsn1Error:
>> ++            pass
>> ++        except RecursionError:
>> ++            assert False, 'Got RecursionError instead of PyAsn1Error'
>> +
>> + suite =3D=20
>> + unittest.TestLoader().loadTestsFromModule(sys.modules[__name__])
>> +
>> +diff --git a/tests/codec/der/test_decoder.py=20
>> +b/tests/codec/der/test_decoder.py index 5bc9deb..b0fa867 100644
>> +--- a/tests/codec/der/test_decoder.py
>> ++++ b/tests/codec/der/test_decoder.py
>> +@@ -361,6 +361,46 @@ class SequenceDecoderWithExplicitlyTaggedSetOfOpen=
TypesTestCase(BaseTestCase):
>> +         assert s[0] =3D=3D 3
>> +         assert s[1][0] =3D=3D univ.OctetString(hexValue=3D'02010C')
>> +
>> ++class NestingDepthLimitTestCase(BaseTestCase):
>> ++    """Test DER decoder protection against deeply nested structures.""=
"
>> ++
>> ++    def testDefiniteLenNesting(self):
>> ++        """Deeply nested definite-length SEQUENCEs must raise PyAsn1Er=
ror."""
>> ++        inner =3D b'\x05\x00'  # NULL
>> ++        for _ in range(200):
>> ++            length =3D len(inner)
>> ++            if length < 128:
>> ++                inner =3D b'\x30' + bytes([length]) + inner
>> ++            else:
>> ++                length_bytes =3D length.to_bytes(
>> ++                    (length.bit_length() + 7) // 8, 'big')
>> ++                inner =3D b'\x30' + bytes([0x80 | len(length_bytes)]) =
+ \
>> ++                    length_bytes + inner
>> ++        try:
>> ++            decoder.decode(inner)
>> ++        except PyAsn1Error:
>> ++            pass
>> ++        else:
>> ++            assert False, 'Deeply nested definite-length SEQUENCEs not=
 rejected'
>> ++
>> ++    def testNoRecursionError(self):
>> ++        """Must raise PyAsn1Error, not RecursionError."""
>> ++        inner =3D b'\x05\x00'
>> ++        for _ in range(200):
>> ++            length =3D len(inner)
>> ++            if length < 128:
>> ++                inner =3D b'\x30' + bytes([length]) + inner
>> ++            else:
>> ++                length_bytes =3D length.to_bytes(
>> ++                    (length.bit_length() + 7) // 8, 'big')
>> ++                inner =3D b'\x30' + bytes([0x80 | len(length_bytes)]) =
+ \
>> ++                    length_bytes + inner
>> ++        try:
>> ++            decoder.decode(inner)
>> ++        except PyAsn1Error:
>> ++            pass
>> ++        except RecursionError:
>> ++            assert False, 'Got RecursionError instead of PyAsn1Error'
>> +
>> + suite =3D=20
>> + unittest.TestLoader().loadTestsFromModule(sys.modules[__name__])
>> +
>> +--
>> +2.34.1
>> +
>
>
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS


