Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 798D8770DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:43:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1M5hk1e026206
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 21 Feb 2016 21:43:46 -0800 (PST)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 21 Feb 2016 21:43:45 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>, Joshua Lock
	<joshua.g.lock@linux.intel.com>
References: <cover.1447412835.git.hongxu.jia@windriver.com>
	<CAHiDW_HddeP2fLOCBWSG7=cfS0Zuaoh0gnW3nBpLTtjH62huRA@mail.gmail.com>
	<5645D501.6020802@windriver.com>
	<7548678.UPkFnu4iOC@peggleto-mobl.ger.corp.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56CAA00F.6040902@windriver.com>
Date: Mon, 22 Feb 2016 13:43:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <7548678.UPkFnu4iOC@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] wpa-supplicant: Fix CVE-2015-8041
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
X-List-Received-Date: Mon, 22 Feb 2016 05:43:52 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


On 02/22/2016 12:15 PM, Paul Eggleton wrote:
> Hi Robert,
>
> I just noticed this never got merged into jethro. Could you take care of that?
> The original patch is here:

Got it, thanks.

// Robert

>
> http://patchwork.openembedded.org/patch/107625/
>
> Joshua, looks like we could use this one in fido as well.
>
> Thanks,
> Paul
>
> On Fri, 13 Nov 2015 20:18:09 Hongxu Jia wrote:
>> On 11/13/2015 08:11 PM, Jussi Kukkonen wrote:
>>> On 13 November 2015 at 13:08, Hongxu Jia <hongxu.jia@windriver.com
>>>
>>> <mailto:hongxu.jia@windriver.com>> wrote:
>>>      Backport patch from http://w1.fi/security/2015-5/
>>>      and rebase for wpa-supplicant 2.4
>>>
>>> There's a thread about upgrading master to 2.5 (which should fix this)
>>> already.
>>> The patch probably still makes sense for jethro though.
>>
>> Yes, you are right, the 2.5 don't need this, it makes sense for jethro.
>>
>> //Hongxu
>>
>>>   - Jussi
>>>
>>>      Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>>>      <mailto:hongxu.jia@windriver.com>>
>>>      ---
>>>
>>>       ...load-length-validation-in-NDEF-record-par.patch | 64
>>>
>>>      ++++++++++++++++++++++
>>>
>>>       .../wpa-supplicant/wpa-supplicant_2.4.bb
>>>
>>>      <http://wpa-supplicant_2.4.bb>           | 1 +
>>>
>>>       2 files changed, 65 insertions(+)
>>>       create mode 100644
>>>
>>>      meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-p
>>>      ayload-length-validation-in-NDEF-record-par.patch
>>>
>>>      diff --git
>>>      a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix
>>>      -payload-length-validation-in-NDEF-record-par.patch
>>>      b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fi
>>>      x-payload-length-validation-in-NDEF-record-par.patch new file mode
>>>      100644
>>>      index 0000000..bc1d1e5
>>>      --- /dev/null
>>>      +++
>>>      b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix
>>>      -payload-length-validation-in-NDEF-record-par.patch @@ -0,0 +1,64 @@
>>>      +From c13401c723a039971bcd91b3856d76c6041b15f2 Mon Sep 17 00:00:00
>>>      2001
>>>      +From: Jouni Malinen <j@w1.fi <mailto:j@w1.fi>>
>>>      +Date: Fri, 13 Nov 2015 05:54:18 -0500
>>>      +Subject: [PATCH] NFC: Fix payload length validation in NDEF
>>>      record parser
>>>      +
>>>      +It was possible for the 32-bit record->total_length value to end up
>>>      +wrapping around due to integer overflow if the longer form of payload
>>>      +length field is used and record->payload_length gets a value close to
>>>      +2^32. This could result in ndef_parse_record() accepting a too large
>>>      +payload length value and the record type filter reading up to
>>>      about 20
>>>      +bytes beyond the end of the buffer and potentially killing the
>>>      process.
>>>      +This could also result in an attempt to allocate close to 2^32
>>>      bytes of
>>>      +heap memory and if that were to succeed, a buffer read overflow
>>>      of the
>>>      +same length which would most likely result in the process
>>>      termination.
>>>      +In case of record->total_length ending up getting the value 0, there
>>>      +would be no buffer read overflow, but record parsing would result
>>>      in an
>>>      +infinite loop in ndef_parse_records().
>>>      +
>>>      +Any of these error cases could potentially be used for denial of
>>>      service
>>>      +attacks over NFC by using a malformed NDEF record on an NFC Tag or
>>>      +sending them during NFC connection handover if the application
>>>      providing
>>>      +the NDEF message to hostapd/wpa_supplicant did no validation of the
>>>      +received records. While such validation is likely done in the NFC
>>>      stack
>>>      +that needs to parse the NFC messages before further processing,
>>>      +hostapd/wpa_supplicant better be prepared for any data being included
>>>      +here.
>>>      +
>>>      +Fix this by validating record->payload_length value in a way that
>>>      +detects integer overflow. (CID 122668)
>>>      +
>>>      +Signed-off-by: Jouni Malinen <j@w1.fi <mailto:j@w1.fi>>
>>>      +
>>>      +Upstream-Status: Backport [from http://w1.fi/security/2015-5/]
>>>      +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>>>      <mailto:hongxu.jia@windriver.com>>
>>>      +---
>>>      + src/wps/ndef.c | 5 ++++-
>>>      + 1 file changed, 4 insertions(+), 1 deletion(-)
>>>      +
>>>      +diff --git a/src/wps/ndef.c b/src/wps/ndef.c
>>>      +index d45dfc8..f7f729b 100644
>>>      +--- a/src/wps/ndef.c
>>>      ++++ b/src/wps/ndef.c
>>>      +@@ -48,6 +48,8 @@ static int ndef_parse_record(const u8 *data,
>>>      u32 size,
>>>      +               if (size < 6)
>>>      +                       return -1;
>>>      +               record->payload_length = ntohl(*(u32 *)pos);
>>>      ++                if (record->payload_length > size - 6)
>>>      ++                       return -1;
>>>      +               pos += sizeof(u32);
>>>      +       }
>>>      +
>>>      +@@ -68,7 +70,8 @@ static int ndef_parse_record(const u8 *data,
>>>      u32 size,
>>>      +       pos += record->payload_length;
>>>      +
>>>      +       record->total_length = pos - data;
>>>      +-      if (record->total_length > size)
>>>      ++      if (record->total_length > size ||
>>>      ++          record->total_length < record->payload_length)
>>>      +               return -1;
>>>      +       return 0;
>>>      + }
>>>      +--
>>>      +1.9.1
>>>      +
>>>      diff --git
>>>      a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
>>>      <http://wpa-supplicant_2.4.bb>
>>>      b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
>>>      <http://wpa-supplicant_2.4.bb>
>>>      index a124cf2..6e4d028 100644
>>>      ---
>>>      a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
>>>      <http://wpa-supplicant_2.4.bb>
>>>      +++
>>>      b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
>>>      <http://wpa-supplicant_2.4.bb>
>>>      @@ -32,6 +32,7 @@ SRC_URI =
>>>      "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz
>>>      <http://hostap.epitest.fi/releases/wpa_supplicant-$%7BPV%7D.tar.gz> \
>>>      file://0003-EAP-pwd-peer-Fix-Total-Length-parsing-for-fragment-r.patch
>>>      \
>>>      file://0004-EAP-pwd-server-Fix-Total-Length-parsing-for-fragment.patch
>>>      \
>>>      file://0005-EAP-pwd-peer-Fix-asymmetric-fragmentation-behavior.patch \
>>>      +
>>>
>>>       file://0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patc
>>>       h
>>>
>>>      \
>>>
>>>                 "
>>>
>>>       SRC_URI[md5sum] = "f0037dbe03897dcaf2ad2722e659095d"
>>>       SRC_URI[sha256sum] =
>>>
>>>      "058dc832c096139a059e6df814080f50251a8d313c21b13364c54a1e70109122"
>>>      --
>>>      1.9.1
>>>
>>>      --
>>>      _______________________________________________
>>>      Openembedded-core mailing list
>>>      Openembedded-core@lists.openembedded.org
>>>      <mailto:Openembedded-core@lists.openembedded.org>
>>>      http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

