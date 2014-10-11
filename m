Return-Path: <paul.betafive@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8EC6865DA3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 10:28:03 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id z107so4867032qgd.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 03:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=Bj6dQXUJLQ+jnRvb4TRNn1/BjibQRdTx9HEWMLpnnQY=;
	b=lsDIUA+hbQW2j/iGnO32Z2KyL+ptIhCXIXsdTTXKgiluoohPnP0pDETxCJQhg8zO5n
	KqU725gculcP00H0tasxCHvKoAA89t0GhcqfdFP0g2rgcQbvS/Nog+3J52jbzaN8Nt95
	vaPcO6OeAthPvIf9zD+eYfl+EHjZmqeqAI6gKw7OKYHkREKGHLfoztFF4VuXOV2juNBr
	uJB3G2JHXFvw6KbuFp/jqyXqL+6Vg64Hz+yw5koaoL6Ulvr6l3op+2PLjXBIoG2XscA5
	PwZELaNRLpJB4xCLbhvb9kS/1hMSS79pk7fm8FRqFznA8jEeot9eFKj8261gSHDoxMgC
	7zfg==
X-Received: by 10.229.7.198 with SMTP id e6mr17910973qce.0.1413023284560; Sat,
	11 Oct 2014 03:28:04 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Sat, 11 Oct 2014 03:27:24 -0700 (PDT)
In-Reply-To: <543903BC.6020706@windriver.com>
References: <cover.1412770325.git.hongxu.jia@windriver.com>
	<241e2535b1e3f4544e31fdc40406337b26e8f8d9.1412770325.git.hongxu.jia@windriver.com>
	<CANyK_8eqiktne2E4EwpWoBpz_-xtDweSS56XdBi6ocKoh_Wq2A@mail.gmail.com>
	<543903BC.6020706@windriver.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sat, 11 Oct 2014 11:27:24 +0100
X-Google-Sender-Auth: jfB8UmQZsx7NuZCqaavzDhGNITw
Message-ID: <CANyK_8fkQmOD8=gCkUBG3BSYhF9PCvn2-CYka2Xnk=XBBgWD7w@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] opkg: fix remove pkg with --force-removal-of-dependent-packages failed
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
X-List-Received-Date: Sat, 11 Oct 2014 10:28:05 -0000
X-Groupsio-MsgNum: 58536
Content-Type: multipart/mixed; boundary=001a1133cdb0efa1b30505231e17

--001a1133cdb0efa1b30505231e17
Content-Type: text/plain; charset=UTF-8

On 11 October 2014 11:17, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> On 10/11/2014 05:31 PM, Paul Barker wrote:
>>
>> Your solution looks fine but I'd prefer it to be solved a different
>> way upstream.
>>
>> It should be possible to ensure that duplicates don't enter the
>> removal queue in the first place by checking the return of
>> pkg_vec_contains(dependent_pkgs, dep_pkg) before calling
>> pkg_vec_insert(dependent_pkgs, dep_pkg) in opkg_remove_dependent_pkgs.
>> This would keep the logic in opkg_remove_pkg clean.
>
>
> The pkg_vec_contains(dependent_pkgs, dep_pkg) could not work here.
> Because 'dependent_pkgs' is not global which contains all removed pkgs.
>
> The checking will filter duplicated pkg.
>

I've attached a patch which should apply to opkg v0.2.2 to show what I intended.

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--001a1133cdb0efa1b30505231e17
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-WIP-Attempt-to-fix-duplicate-removal-of-dependent-pa.patch"
Content-Disposition: attachment; 
	filename="0001-WIP-Attempt-to-fix-duplicate-removal-of-dependent-pa.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_i14tivkn0

RnJvbSBiNjYzYTAzMGRiMDhmZWUxZGE0OTc2NDM2YjU4YTdmMWExOWE1NTFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQYXVsIEJhcmtlciA8cGF1bEBwYXVsYmFya2VyLm1lLnVrPgpE
YXRlOiBTYXQsIDExIE9jdCAyMDE0IDEwOjIzOjQ1ICswMDAwClN1YmplY3Q6IFtQQVRDSF0gV0lQ
OiBBdHRlbXB0IHRvIGZpeCBkdXBsaWNhdGUgcmVtb3ZhbCBvZiBkZXBlbmRlbnQgcGFja2FnZXMK
VG86IG9wa2ctZGV2ZWxAZ29vZ2xlZ3JvdXBzLmNvbQoKU2lnbmVkLW9mZi1ieTogUGF1bCBCYXJr
ZXIgPHBhdWxAcGF1bGJhcmtlci5tZS51az4KLS0tCiBsaWJvcGtnL29wa2dfcmVtb3ZlLmMgfCAz
ICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2xpYm9wa2cvb3BrZ19yZW1vdmUuYyBiL2xpYm9wa2cvb3BrZ19yZW1vdmUuYwpp
bmRleCAzNGY5MTU0Li5mYjhhYjUyIDEwMDY0NAotLS0gYS9saWJvcGtnL29wa2dfcmVtb3ZlLmMK
KysrIGIvbGlib3BrZy9vcGtnX3JlbW92ZS5jCkBAIC0xMTcsNyArMTE3LDggQEAgb3BrZ19yZW1v
dmVfZGVwZW5kZW50X3BrZ3MocGtnX3QgKnBrZywgYWJzdHJhY3RfcGtnX3QgKipkZXBlbmRlbnRz
KQogICAgICAgICBpZiAoZGVwX2FiX3BrZy0+c3RhdGVfc3RhdHVzID09IFNTX0lOU1RBTExFRCkg
ewogICAgICAgICAgICAgZm9yIChhID0gMDsgYSA8IGRlcF9hYl9wa2ctPnBrZ3MtPmxlbjsgYSsr
KSB7CiAgICAgICAgICAgICAgICAgcGtnX3QgKmRlcF9wa2cgPSBkZXBfYWJfcGtnLT5wa2dzLT5w
a2dzW2FdOwotICAgICAgICAgICAgICAgIGlmIChkZXBfcGtnLT5zdGF0ZV9zdGF0dXMgPT0gU1Nf
SU5TVEFMTEVEKSB7CisgICAgICAgICAgICAgICAgaWYgKGRlcF9wa2ctPnN0YXRlX3N0YXR1cyA9
PSBTU19JTlNUQUxMRUQKKyAgICAgICAgICAgICAgICAgICAgICAgICYmICFwa2dfdmVjX2NvbnRh
aW5zKGRlcGVuZGVudF9wa2dzLCBkZXBfcGtnKSkgewogICAgICAgICAgICAgICAgICAgICBwa2df
dmVjX2luc2VydChkZXBlbmRlbnRfcGtncywgZGVwX3BrZyk7CiAgICAgICAgICAgICAgICAgICAg
IGNvdW50Kys7CiAgICAgICAgICAgICAgICAgfQotLSAKMi4xLjIKCg==

--001a1133cdb0efa1b30505231e17--
