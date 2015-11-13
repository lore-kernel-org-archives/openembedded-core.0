Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 99AA1772FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 12:18:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tADCIJUB001914
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Nov 2015 04:18:20 -0800 (PST)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 13 Nov 2015 04:18:19 -0800
Message-ID: <5645D501.6020802@windriver.com>
Date: Fri, 13 Nov 2015 20:18:09 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <cover.1447412835.git.hongxu.jia@windriver.com>
	<5c711f4f61c7a1481e415ec45290301141d45b48.1447412835.git.hongxu.jia@windriver.com>
	<CAHiDW_HddeP2fLOCBWSG7=cfS0Zuaoh0gnW3nBpLTtjH62huRA@mail.gmail.com>
In-Reply-To: <CAHiDW_HddeP2fLOCBWSG7=cfS0Zuaoh0gnW3nBpLTtjH62huRA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 13 Nov 2015 12:18:20 -0000
Content-Type: multipart/alternative;
	boundary="------------030706040602000103010000"

--------------030706040602000103010000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2015 08:11 PM, Jussi Kukkonen wrote:
> On 13 November 2015 at 13:08, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     Backport patch from http://w1.fi/security/2015-5/
>     and rebase for wpa-supplicant 2.4
>
>
> There's a thread about upgrading master to 2.5 (which should fix this) 
> already.
> The patch probably still makes sense for jethro though.
>

Yes, you are right, the 2.5 don't need this, it makes sense for jethro.

//Hongxu

>  - Jussi
>
>
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     ---
>      ...load-length-validation-in-NDEF-record-par.patch | 64
>     ++++++++++++++++++++++
>      .../wpa-supplicant/wpa-supplicant_2.4.bb
>     <http://wpa-supplicant_2.4.bb>           | 1 +
>      2 files changed, 65 insertions(+)
>      create mode 100644
>     meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch
>
>     diff --git
>     a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch
>     b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch
>     new file mode 100644
>     index 0000000..bc1d1e5
>     --- /dev/null
>     +++
>     b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch
>     @@ -0,0 +1,64 @@
>     +From c13401c723a039971bcd91b3856d76c6041b15f2 Mon Sep 17 00:00:00
>     2001
>     +From: Jouni Malinen <j@w1.fi <mailto:j@w1.fi>>
>     +Date: Fri, 13 Nov 2015 05:54:18 -0500
>     +Subject: [PATCH] NFC: Fix payload length validation in NDEF
>     record parser
>     +
>     +It was possible for the 32-bit record->total_length value to end up
>     +wrapping around due to integer overflow if the longer form of payload
>     +length field is used and record->payload_length gets a value close to
>     +2^32. This could result in ndef_parse_record() accepting a too large
>     +payload length value and the record type filter reading up to
>     about 20
>     +bytes beyond the end of the buffer and potentially killing the
>     process.
>     +This could also result in an attempt to allocate close to 2^32
>     bytes of
>     +heap memory and if that were to succeed, a buffer read overflow
>     of the
>     +same length which would most likely result in the process
>     termination.
>     +In case of record->total_length ending up getting the value 0, there
>     +would be no buffer read overflow, but record parsing would result
>     in an
>     +infinite loop in ndef_parse_records().
>     +
>     +Any of these error cases could potentially be used for denial of
>     service
>     +attacks over NFC by using a malformed NDEF record on an NFC Tag or
>     +sending them during NFC connection handover if the application
>     providing
>     +the NDEF message to hostapd/wpa_supplicant did no validation of the
>     +received records. While such validation is likely done in the NFC
>     stack
>     +that needs to parse the NFC messages before further processing,
>     +hostapd/wpa_supplicant better be prepared for any data being included
>     +here.
>     +
>     +Fix this by validating record->payload_length value in a way that
>     +detects integer overflow. (CID 122668)
>     +
>     +Signed-off-by: Jouni Malinen <j@w1.fi <mailto:j@w1.fi>>
>     +
>     +Upstream-Status: Backport [from http://w1.fi/security/2015-5/]
>     +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +---
>     + src/wps/ndef.c | 5 ++++-
>     + 1 file changed, 4 insertions(+), 1 deletion(-)
>     +
>     +diff --git a/src/wps/ndef.c b/src/wps/ndef.c
>     +index d45dfc8..f7f729b 100644
>     +--- a/src/wps/ndef.c
>     ++++ b/src/wps/ndef.c
>     +@@ -48,6 +48,8 @@ static int ndef_parse_record(const u8 *data,
>     u32 size,
>     +               if (size < 6)
>     +                       return -1;
>     +               record->payload_length = ntohl(*(u32 *)pos);
>     ++                if (record->payload_length > size - 6)
>     ++                       return -1;
>     +               pos += sizeof(u32);
>     +       }
>     +
>     +@@ -68,7 +70,8 @@ static int ndef_parse_record(const u8 *data,
>     u32 size,
>     +       pos += record->payload_length;
>     +
>     +       record->total_length = pos - data;
>     +-      if (record->total_length > size)
>     ++      if (record->total_length > size ||
>     ++          record->total_length < record->payload_length)
>     +               return -1;
>     +       return 0;
>     + }
>     +--
>     +1.9.1
>     +
>     diff --git
>     a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
>     <http://wpa-supplicant_2.4.bb>
>     b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
>     <http://wpa-supplicant_2.4.bb>
>     index a124cf2..6e4d028 100644
>     ---
>     a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
>     <http://wpa-supplicant_2.4.bb>
>     +++
>     b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.4.bb
>     <http://wpa-supplicant_2.4.bb>
>     @@ -32,6 +32,7 @@ SRC_URI =
>     "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz
>     <http://hostap.epitest.fi/releases/wpa_supplicant-$%7BPV%7D.tar.gz> \
>     file://0003-EAP-pwd-peer-Fix-Total-Length-parsing-for-fragment-r.patch
>     \
>     file://0004-EAP-pwd-server-Fix-Total-Length-parsing-for-fragment.patch
>     \
>     file://0005-EAP-pwd-peer-Fix-asymmetric-fragmentation-behavior.patch \
>     +
>      file://0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch
>     \
>                "
>      SRC_URI[md5sum] = "f0037dbe03897dcaf2ad2722e659095d"
>      SRC_URI[sha256sum] =
>     "058dc832c096139a059e6df814080f50251a8d313c21b13364c54a1e70109122"
>     --
>     1.9.1
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


--------------030706040602000103010000
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 11/13/2015 08:11 PM, Jussi Kukkonen
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAHiDW_HddeP2fLOCBWSG7=cfS0Zuaoh0gnW3nBpLTtjH62huRA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">On 13 November 2015 at 13:08, Hongxu
            Jia <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:hongxu.jia@windriver.com" target="_blank">hongxu.jia@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">Backport
              patch from <a moz-do-not-send="true"
                href="http://w1.fi/security/2015-5/" rel="noreferrer"
                target="_blank">http://w1.fi/security/2015-5/</a><br>
              and rebase for wpa-supplicant 2.4</blockquote>
            <div><br>
            </div>
            <div>There's a thread about upgrading master to 2.5 (which
              should fix this) already.</div>
            <div> </div>
            <div>The patch probably still makes sense for jethro though.</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Yes, you are right, the 2.5 don't need this, it makes sense for
    jethro.<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote
cite="mid:CAHiDW_HddeP2fLOCBWSG7=cfS0Zuaoh0gnW3nBpLTtjH62huRA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div> - Jussi</div>
            <div><br>
            </div>
            <div><br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"> <br>
            </blockquote>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              Signed-off-by: Hongxu Jia &lt;<a moz-do-not-send="true"
                href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt;<br>
              ---<br>
              <span class=""> ...load-length-validation-in-NDEF-record-par.patch
                | 64 ++++++++++++++++++++++<br>
                 .../wpa-supplicant/<a moz-do-not-send="true"
                  href="http://wpa-supplicant_2.4.bb" rel="noreferrer"
                  target="_blank">wpa-supplicant_2.4.bb</a>           | 
                1 +<br>
                 2 files changed, 65 insertions(+)<br>
                 create mode 100644
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch<br>
                <br>
              </span>diff --git
              a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch<br>
              new file mode 100644<br>
              index 0000000..bc1d1e5<br>
              --- /dev/null<br>
              +++
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch<br>
              @@ -0,0 +1,64 @@<br>
              +From c13401c723a039971bcd91b3856d76c6041b15f2 Mon Sep 17
              00:00:00 2001<br>
              +From: Jouni Malinen &lt;<a moz-do-not-send="true"
                href="mailto:j@w1.fi">j@w1.fi</a>&gt;<br>
              +Date: Fri, 13 Nov 2015 05:54:18 -0500<br>
              +Subject: [PATCH] NFC: Fix payload length validation in
              NDEF record parser<br>
              +<br>
              +It was possible for the 32-bit record-&gt;total_length
              value to end up<br>
              +wrapping around due to integer overflow if the longer
              form of payload<br>
              +length field is used and record-&gt;payload_length gets a
              value close to<br>
              +2^32. This could result in ndef_parse_record() accepting
              a too large<br>
              +payload length value and the record type filter reading
              up to about 20<br>
              +bytes beyond the end of the buffer and potentially
              killing the process.<br>
              +This could also result in an attempt to allocate close to
              2^32 bytes of<br>
              +heap memory and if that were to succeed, a buffer read
              overflow of the<br>
              +same length which would most likely result in the process
              termination.<br>
              +In case of record-&gt;total_length ending up getting the
              value 0, there<br>
              +would be no buffer read overflow, but record parsing
              would result in an<br>
              +infinite loop in ndef_parse_records().<br>
              +<br>
              +Any of these error cases could potentially be used for
              denial of service<br>
              +attacks over NFC by using a malformed NDEF record on an
              NFC Tag or<br>
              +sending them during NFC connection handover if the
              application providing<br>
              +the NDEF message to hostapd/wpa_supplicant did no
              validation of the<br>
              +received records. While such validation is likely done in
              the NFC stack<br>
              +that needs to parse the NFC messages before further
              processing,<br>
              +hostapd/wpa_supplicant better be prepared for any data
              being included<br>
              +here.<br>
              +<br>
              +Fix this by validating record-&gt;payload_length value in
              a way that<br>
              +detects integer overflow. (CID 122668)<br>
              +<br>
              +Signed-off-by: Jouni Malinen &lt;<a
                moz-do-not-send="true" href="mailto:j@w1.fi">j@w1.fi</a>&gt;<br>
              +<br>
              +Upstream-Status: Backport [from <a
                moz-do-not-send="true"
                href="http://w1.fi/security/2015-5/" rel="noreferrer"
                target="_blank">http://w1.fi/security/2015-5/</a>]<br>
              +Signed-off-by: Hongxu Jia &lt;<a moz-do-not-send="true"
                href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt;<br>
              +---<br>
              + src/wps/ndef.c | 5 ++++-<br>
              + 1 file changed, 4 insertions(+), 1 deletion(-)<br>
              +<br>
              +diff --git a/src/wps/ndef.c b/src/wps/ndef.c<br>
              +index d45dfc8..f7f729b 100644<br>
              +--- a/src/wps/ndef.c<br>
              ++++ b/src/wps/ndef.c<br>
              +@@ -48,6 +48,8 @@ static int ndef_parse_record(const u8
              *data, u32 size,<br>
              +               if (size &lt; 6)<br>
              +                       return -1;<br>
              +               record-&gt;payload_length = ntohl(*(u32
              *)pos);<br>
              ++                if (record-&gt;payload_length &gt; size
              - 6)<br>
              ++                       return -1;<br>
              +               pos += sizeof(u32);<br>
              +       }<br>
              +<br>
              +@@ -68,7 +70,8 @@ static int ndef_parse_record(const u8
              *data, u32 size,<br>
              +       pos += record-&gt;payload_length;<br>
              +<br>
              +       record-&gt;total_length = pos - data;<br>
              +-      if (record-&gt;total_length &gt; size)<br>
              ++      if (record-&gt;total_length &gt; size ||<br>
              ++          record-&gt;total_length &lt;
              record-&gt;payload_length)<br>
              +               return -1;<br>
              +       return 0;<br>
              + }<br>
              +--<br>
              +1.9.1<br>
              +<br>
              diff --git a/meta/recipes-connectivity/wpa-supplicant/<a
                moz-do-not-send="true"
                href="http://wpa-supplicant_2.4.bb" rel="noreferrer"
                target="_blank">wpa-supplicant_2.4.bb</a>
              b/meta/recipes-connectivity/wpa-supplicant/<a
                moz-do-not-send="true"
                href="http://wpa-supplicant_2.4.bb" rel="noreferrer"
                target="_blank">wpa-supplicant_2.4.bb</a><br>
              index a124cf2..6e4d028 100644<br>
              --- a/meta/recipes-connectivity/wpa-supplicant/<a
                moz-do-not-send="true"
                href="http://wpa-supplicant_2.4.bb" rel="noreferrer"
                target="_blank">wpa-supplicant_2.4.bb</a><br>
              +++ b/meta/recipes-connectivity/wpa-supplicant/<a
                moz-do-not-send="true"
                href="http://wpa-supplicant_2.4.bb" rel="noreferrer"
                target="_blank">wpa-supplicant_2.4.bb</a><br>
              @@ -32,6 +32,7 @@ SRC_URI = "<a moz-do-not-send="true"
                href="http://hostap.epitest.fi/releases/wpa_supplicant-$%7BPV%7D.tar.gz"
                rel="noreferrer" target="_blank">http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz</a>
              \<br>
                         
              <a class="moz-txt-link-freetext" href="file://0003-EAP-pwd-peer-Fix-Total-Length-parsing-for-fragment-r.patch">file://0003-EAP-pwd-peer-Fix-Total-Length-parsing-for-fragment-r.patch</a>
              \<br>
                         
              <a class="moz-txt-link-freetext" href="file://0004-EAP-pwd-server-Fix-Total-Length-parsing-for-fragment.patch">file://0004-EAP-pwd-server-Fix-Total-Length-parsing-for-fragment.patch</a>
              \<br>
                         
              <a class="moz-txt-link-freetext" href="file://0005-EAP-pwd-peer-Fix-asymmetric-fragmentation-behavior.patch">file://0005-EAP-pwd-peer-Fix-asymmetric-fragmentation-behavior.patch</a>
              \<br>
              +         
               <a class="moz-txt-link-freetext" href="file://0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch">file://0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch</a>
              \<br>
                         "<br>
               SRC_URI[md5sum] = "f0037dbe03897dcaf2ad2722e659095d"<br>
               SRC_URI[sha256sum] =
              "058dc832c096139a059e6df814080f50251a8d313c21b13364c54a1e70109122"<br>
              <div class="HOEnZb">
                <div class="h5">--<br>
                  1.9.1<br>
                  <br>
                  --<br>
                  _______________________________________________<br>
                  Openembedded-core mailing list<br>
                  <a moz-do-not-send="true"
                    href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
                  <a moz-do-not-send="true"
                    href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                    rel="noreferrer" target="_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
                </div>
              </div>
            </blockquote>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------030706040602000103010000--
