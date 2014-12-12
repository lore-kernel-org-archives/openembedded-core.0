Return-Path: <petr.nechaev@cogentembedded.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id AEF2A72482
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Dec 2014 11:10:56 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id s18so5961501lam.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Dec 2014 03:10:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc
	:content-type;
	bh=KaEXjySzk2oKnkPFM4tyTvlLguwoXNYEap78snO2/nY=;
	b=glcnwi3Cf9Xyuv9AzQ6sYWShaeA5ZxBKbBntlfJL9B8Czin2Bg6A3ef+tZ2twIOcxd
	kvnMg86fwAzDpHL0pUSkIDFRFVTQD150vzvDfs0NmuZDq56iUPa+gcRjbU5hm4VP1R2Z
	g3ChJ7oDUWgFONm5A9hD7xbgE9L5LQEl6hampkkOqQnij3WTNcqejiO0NpqCpLwawRyN
	b1wcrOGU+IUBKH/aTfXhQ8AS3/weroUzylNzSquVPQ0SCnim1nOYTcxA5ZF4FXAKpwmQ
	0aJSYvFmSk8YLNxIGriNkDWFQoCKGeM2CWVoY7JJzQjkSYah39jiLeLQ1X1howHWYTrn
	1/UA==
X-Gm-Message-State: ALoCoQnFhcTvRWQlJ2YE8cGXvVkRulwNxQsDbqqF8SKmAK3ydZ6A0lDkpy7vvaF740U+XJcaT1k8
MIME-Version: 1.0
X-Received: by 10.112.166.5 with SMTP id zc5mr14994495lbb.20.1418382656825;
	Fri, 12 Dec 2014 03:10:56 -0800 (PST)
Received: by 10.25.23.170 with HTTP; Fri, 12 Dec 2014 03:10:56 -0800 (PST)
Date: Fri, 12 Dec 2014 15:10:56 +0400
Message-ID: <CAHPquwPeWTTEG3am=boHaLaWDsY9TQbVq9h8ckqnn+1=5VYnzw@mail.gmail.com>
From: Petr Nechaev <petr.nechaev@cogentembedded.com>
To: Gary Robertson <gary.robertson@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] Rootfs over 4GB
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
X-List-Received-Date: Fri, 12 Dec 2014 11:11:01 -0000
X-Groupsio-MsgNum: 60464
Content-Type: multipart/mixed; boundary=001a11c269066a9325050a02f2a8

--001a11c269066a9325050a02f2a8
Content-Type: multipart/alternative; boundary=001a11c269066a9321050a02f2a6

--001a11c269066a9321050a02f2a6
Content-Type: text/plain; charset=UTF-8

Hi All,

I've created a patch to fix this issue.
It can be enabled by setting  SEPARATE_ROOTFS = "1"  in local.conf.
Rootfs.img is then put into a separate ext3 partition.

In hope it will be useful.

---
Petr

On Thu, Dec 4, 2014 at 11:25 PM, Gary Robertson <gary.robertson@linaro.org>
wrote:
>
> AFAIK, the reasons for using FAT are:
> (1) it is the most universally accepted filesystem format for devices and
> OS environments,
> (2) it is usable with almost all boot loaders produced anywhere by anyone,
> and
> (3) it is the de facto standard format for flash-based devices of all types
>
> Your solution of creating a small FAT partition for booting and ext3 for
> the root filesystem is probably
> the cleanest way of implementing large filesystem images for a Linux
> environment.
>
>
> On Thu, Dec 4, 2014 at 2:10 PM, Petr Nechaev <
> petr.nechaev@cogentembedded.com> wrote:
>
>> Hi All,
>>
>>  I'm using oe-core for building images and have a problem. Rootfs.img is
>> over 5GB and cannot be copied to FAT32 partition because of file size
>> limit. This happens during do_bootimg task for core-image-sato-sdk. No
>> warning is given by bitbake.
>>  The problem occurs in build_fat_img() function in bootimg.bbclass.
>>
>>  I have temporarily fixed the problem in my build by extending
>> bootimg.bbclass. I added new function which first splits *.hddimg into two
>> partitions: FAT + ext3 and then puts rootfs.img to ext3 partition.
>>
>>  But, what is the right way of building core-image-sato-sdk with large
>> rootfs? And what is the technical reason behind putting rootfs.img into a
>> FAT partition?
>>
>> ---
>> Petr
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>

--001a11c269066a9321050a02f2a6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi All,</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">I&#39;ve created a patch to f=
ix this issue.=C2=A0</div><div class=3D"gmail_extra">It can be enabled by s=
etting =C2=A0SEPARATE_ROOTFS =3D &quot;1&quot; =C2=A0in local.conf.=C2=A0 R=
ootfs.img is then put into a separate ext3 partition.</div><div class=3D"gm=
ail_extra"><br>In hope it will be useful.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">---<br></div><div class=3D"gmail_extra"=
><div><div class=3D"gmail_signature"><div dir=3D"ltr"><div>Petr<br></div></=
div></div></div>
<br><div class=3D"gmail_quote">On Thu, Dec 4, 2014 at 11:25 PM, Gary Robert=
son <span dir=3D"ltr">&lt;<a href=3D"mailto:gary.robertson@linaro.org" targ=
et=3D"_blank">gary.robertson@linaro.org</a>&gt;</span> wrote:<blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1e=
x"><div dir=3D"ltr"><div><div><div><div>AFAIK, the reasons for using FAT ar=
e:<br>(1) it is the most universally accepted filesystem format for devices=
 and OS environments,<br></div>(2) it is usable with almost all boot loader=
s produced anywhere by anyone, and<br></div>(3) it is the de facto standard=
 format for flash-based devices of all types<br><br></div>Your solution of =
creating a small FAT partition for booting and ext3 for the root filesystem=
 is probably<br></div>the cleanest way of implementing large filesystem ima=
ges for a Linux environment.<br><br></div><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote"><div><div class=3D"h5">On Thu, Dec 4, 2014 at 2:10=
 PM, Petr Nechaev <span dir=3D"ltr">&lt;<a href=3D"mailto:petr.nechaev@coge=
ntembedded.com" target=3D"_blank">petr.nechaev@cogentembedded.com</a>&gt;</=
span> wrote:<br></div></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,20=
4);border-left-style:solid;padding-left:1ex"><div><div class=3D"h5"><div di=
r=3D"ltr"><div><div dir=3D"ltr"><span><div style=3D"font-size:13px">Hi All,=
</div><div style=3D"font-size:13px"><br></div><div style=3D"font-size:13px"=
>=C2=A0I&#39;m using oe-core for building images and have a problem. Rootfs=
.img is over 5GB and cannot be copied to FAT32 partition because of file si=
ze limit. This happens during do_bootimg task for core-image-sato-sdk. No w=
arning is given by bitbake.</div><div style=3D"font-size:13px">=C2=A0The pr=
oblem occurs in build_fat_img() function in bootimg.bbclass.=C2=A0<br></div=
><div style=3D"font-size:13px"><br></div></span><div style=3D"font-size:13p=
x">=C2=A0I have temporarily fixed the problem in my build by extending boot=
img.bbclass. I added new function which first splits *.hddimg into two part=
itions: FAT + ext3 and then puts rootfs.img to ext3 partition.=C2=A0</div><=
div style=3D"font-size:13px"><br></div><div style=3D"font-size:13px">=C2=A0=
But, what is the right way of building core-image-sato-sdk with large rootf=
s? And what is the technical reason behind putting rootfs.img into a FAT pa=
rtition?</div><div style=3D"font-size:13px"><br></div><div style=3D"font-si=
ze:13px">---<br></div><div style=3D"font-size:13px"><div dir=3D"ltr">Petr</=
div></div></div></div>
</div>
<br></div></div><span class=3D""><font color=3D"#888888">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
<br></font></span></blockquote></div><br></div>
</blockquote></div></div></div>

--001a11c269066a9321050a02f2a6--

--001a11c269066a9325050a02f2a8
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-Modified-bootimg.bbclass-to-support-rootfs-over-4GB.patch"
Content-Disposition: attachment; 
	filename="0001-Modified-bootimg.bbclass-to-support-rootfs-over-4GB.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_i3lg8w3o0

RnJvbSAzODgzODliMzUzZGNmZTQzMTVhMTRjZTU4YTcyZTMwYWJmOTYxYTAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQZXRyIE5lY2hhZXYgPHBldHIubmVjaGFldkBjb2dlbnRlbWJl
ZGRlZC5jb20+CkRhdGU6IEZyaSwgMTIgRGVjIDIwMTQgMTQ6MDM6MjUgKzAzMDAKU3ViamVjdDog
W1BBVENIXSBNb2RpZmllZCBib290aW1nLmJiY2xhc3MgdG8gc3VwcG9ydCByb290ZnMgb3ZlciA0
R0IKCkZpeGVkIGEgcHJvYmxlbSB3aGVuIHJvb3Rmcy5pbWcgaXMgb3ZlciA0R0IgYW5kIGNhbm5v
dCBiZSBjb3BpZWQgdG8gYQpGQVQzMiBwYXJ0aXRpb24uIEFkZGVkIGJ1aWxkX3R3b19wYXJ0aXRp
b25zKCkgd2hpY2ggZmlyc3Qgc3BsaXRzCiouaGRkaW1nIGludG8gdHdvIHBhcnRpdGlvbnM6IEZB
VCArIGV4dDMgYW5kIHRoZW4gcHV0cyByb290ZnMuaW1nIHRvCmV4dDMgcGFydGl0aW9uLgotLS0K
IG1ldGEvY2xhc3Nlcy9ib290aW1nLmJiY2xhc3MgfCAxMDIgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDk3IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzL2Jvb3RpbWcuYmJjbGFz
cyBiL21ldGEvY2xhc3Nlcy9ib290aW1nLmJiY2xhc3MKaW5kZXggODU5ZDUxNy4uMmNlZDhjMyAx
MDA2NDQKLS0tIGEvbWV0YS9jbGFzc2VzL2Jvb3RpbWcuYmJjbGFzcworKysgYi9tZXRhL2NsYXNz
ZXMvYm9vdGltZy5iYmNsYXNzCkBAIC0zNiw2ICszNiw3IEBAIEVYQ0xVREVfRlJPTV9XT1JMRCA9
ICIxIgogSERERElSID0gIiR7U30vaGRkaW1nIgogSVNPRElSID0gIiR7U30vaXNvIgogRUZJSU1H
RElSID0gIiR7U30vZWZpX2ltZyIKK1JPT1RGU0RJUiA9ICIke1N9L3Jvb3Rmc19pbWciCiBDT01Q
QUNUX0lTT0RJUiA9ICIke1N9L2lzby56IgogQ09NUFJFU1NJU08gPz0gIjAiCiAKQEAgLTU3LDEy
ICs1OCwxNiBAQCBkZWYgcGNiaW9zKGQpOgogCiBQQ0JJT1MgPSAiJHtAcGNiaW9zKGQpfSIKIAor
IyBzZXQgdGhpcyBlbmFibGUgY3JlYXRpb24gb2YgbGFyZ2UgaW1hZ2VzIHdpdGggc2VwYXJhdGUg
cm9vdGZzIHBhcnRpdGlvbgorU0VQQVJBVEVfUk9PVEZTID89ICIwIgorCiAjIFRoZSBzeXNsaW51
eCBpcyByZXF1aXJlZCBmb3IgdGhlIGlzb2h5YnJpZCBjb21tYW5kIGFuZCBib290IGNhdGFsb2cK
IGluaGVyaXQgc3lzbGludXgKIGluaGVyaXQgJHtFRklfQ0xBU1N9CiAKIHBvcHVsYXRlKCkgewog
CURFU1Q9JDEKKwlET19OT1RfTUFLRV9ST09URlM9JDIKIAlpbnN0YWxsIC1kICR7REVTVH0KIAog
CSMgSW5zdGFsbCBiekltYWdlLCBpbml0cmQsIGFuZCByb290ZnMuaW1nIGluIERFU1QgZm9yIGFs
bCBsb2FkZXJzIHRvIHVzZS4KQEAgLTgyLDcgKzg3LDcgQEAgcG9wdWxhdGUoKSB7CiAJCWNobW9k
IDA2NDQgJHtERVNUfS9pbml0cmQKIAlmaQogCi0JaWYgWyAtbiAiJHtST09URlN9IiBdICYmIFsg
LXMgIiR7Uk9PVEZTfSIgXTsgdGhlbgorCWlmIFsgLW4gIiR7Uk9PVEZTfSIgXSAmJiBbIC1zICIk
e1JPT1RGU30iIF0gJiYgWyAhICIke0RPX05PVF9NQUtFX1JPT1RGU30iID0gIjEiIF07IHRoZW4K
IAkJaW5zdGFsbCAtbSAwNjQ0ICR7Uk9PVEZTfSAke0RFU1R9L3Jvb3Rmcy5pbWcKIAlmaQogCkBA
IC0xMDQsNyArMTA5LDcgQEAgYnVpbGRfaXNvKCkgewogCWRvbmUKIAogCi0JcG9wdWxhdGUgJHtJ
U09ESVJ9CisJcG9wdWxhdGUgJHtJU09ESVJ9IDEKIAogCWlmIFsgIiR7UENCSU9TfSIgPSAiMSIg
XTsgdGhlbgogCQlzeXNsaW51eF9pc29fcG9wdWxhdGUgJHtJU09ESVJ9CkBAIC0yMjUsMTAgKzIz
MCw4MyBAQCBidWlsZF9mYXRfaW1nKCkgewogCW1jb3B5IC1pICR7RkFUSU1HfSAtcyAke0ZBVFNP
VVJDRURJUn0vKiA6Oi8KIH0KIAorCitidWlsZF90d29fcGFydGl0aW9ucygpIHsKKwlGQVRfSU1H
PSQxCisJUk9PVF9GUz0kMgorCUhERElNRz0kMworCSMgY29tYmluZSB0d28gcGFydGl0aW9ucyBp
bnRvIHNpbmdsZSBpbWFnZSBmaWxlCisJCisJIyBjYWxjdWxhdGUgcGFydGl0aW9uIHNpemVzCisJ
Uk9PVEZTX1NJWkU9JChzdGF0IC1MYyVzICR7Uk9PVF9GU30pCisJRkFUSU1HX1NJWkU9JChzdGF0
IC1MYyVzICR7RkFUX0lNR30pCisJUk9PVEZTX1NJWkVfTT0kKGV4cHIgJFJPT1RGU19TSVpFIC8g
IDEwMjQgLyAxMDI0ICArIDEgKyAxMDApCisJRkFUSU1HX1NJWkVfTT0kKGV4cHIgJEZBVElNR19T
SVpFIC8gIDEwMjQgLyAxMDI0ICArIDEpCisJRElTS19TSVpFX009JChleHByICRST09URlNfU0la
RV9NICsgJEZBVElNR19TSVpFX00gICsgNTAgKQorCSMgb3ZlcmhlYWQgaXNuJ3Qgc28gaW1wb3J0
YW50IGJlY2F1c2Ugd2UnbGwgdXNlIHRoaXMgYXBwcm9hY2ggb25seSBmb3IgbGFyZ2UgaW1hZ2Vz
CisKKwkjIGNyZWF0ZSBzcGFyc2UgaW1hZ2UKKwlkZCBpZj0vZGV2L3plcm8gb2Y9IiR7SERESU1H
fSIgc2Vlaz0iJHtESVNLX1NJWkVfTX0iTSBicz0xIGNvdW50PTAgCisJCisJIyBjcmVhdGUgdHdv
IHBhcnRpdGlvbnMKKwkjIFRPRE86IHNldHVwIHByb3BlciBnZW9tZXRyeSBmaXJzdAorCWNtZD0i
cFxub1xuIgorCSMgY3JlYXRlIGZpcnN0IHBhcnRpdGlvbiBmb3IgRkFUCisJY21kPSIke2NtZH1u
XG5wXG4xXG5cbiske0ZBVElNR19TSVpFX019TVxuIgorCSMgY2hhbmdlIHR5cGUgdG8gRkFUCisJ
Y21kPSIke2NtZH10XG5iXG4iCisJIyBjcmVhdGUgc2Vjb25kIHBhcnRpdGlvbiBmb3Igcm9vdGZz
CisJY21kPSIke2NtZH1uXG5wXG4yXG5cbiske1JPT1RGU19TSVpFX019TVxuIgorCSMgbWFrZSB0
aGUgZmlyc3QgcGFydGl0aW9uIGJvb3RhYmxlCisJY21kPSIke2NtZH1hXG4xXG4iCisJIyBwcmlu
dCBhbmQgd3JpdGUgY2hhbmdlcyB0byBkaXNrCisJY21kPSIke2NtZH1wXG53XG4iCisJZWNobyAt
ZSAiJHtjbWR9IiB8IGZkaXNrICIke0hERElNR30iCisKKwkjIG1vdW50IHRoZXNlIHBhcnRpdGlv
bnMKKwlkZXZpY2VzPSQoc3VkbyBrcGFydHggLWFzdiAiJHtIRERJTUd9IikKKwlmYXRfbG9vcD0k
KGVjaG8gIiR7ZGV2aWNlc30iIHwgc2VkIC1uICcxIHMvLipcKGxvb3BbMC05XSpwWzAtOV0qXCku
Ki9cMS9wJykKKwlyb290ZnNfbG9vcD0kKGVjaG8gIiR7ZGV2aWNlc30iIHwgc2VkIC1uICcyIHMv
LipcKGxvb3BbMC05XSpwWzAtOV0qXCkuKi9cMS9wJykKKworCSNlY2hvIC1lICJlY2hvPSRmYXRf
bG9vcCBcbiBlY2hvPSRyb290ZnNfbG9vcCBcbiIKKworCSMgY2hlY2sgdGhhdCB3ZSBoYXZlIHR3
byBwYXJ0aXRpb25zCisJaWYgWyAteiAiJHtmYXRfbG9vcH0iIF0gfHwgWyAteiAiJHtyb290ZnNf
bG9vcH0iIF07IHRoZW4KKwkJIyBjbGVhbnVwCisJCXN1ZG8ga3BhcnR4IC1kc3YgIiR7SERESU1H
fSIKKworCQkjIGFuZCBmYWlsCisJCWJiZmF0YWwgIkNyZWF0aW9uIG9mIHRoZSBkaXNrIGZhaWxl
ZC4iCisJZmkKKworCSMgZGQgZmF0IGltYWdlIAorCXN1ZG8gZGQgaWY9IiR7RkFUX0lNR30iIG9m
PSIvZGV2L21hcHBlci8ke2ZhdF9sb29wfSIgYnM9MU0KKworCSMgQ3JlYXRlIGV4dDMgZnMKKwlz
dWRvIG1rZnMgLXQgZXh0MyAiL2Rldi9tYXBwZXIvJHtyb290ZnNfbG9vcH0iCisJc3luYworCW1r
ZGlyIC1wICIke1JPT1RGU0RJUn0iCisJc3VkbyBtb3VudCAiL2Rldi9tYXBwZXIvJHtyb290ZnNf
bG9vcH0iICIke1JPT1RGU0RJUn0iCisJCisJIyBjb3B5IHRoZSBmaWxlCisJc3VkbyBpbnN0YWxs
IC1tIDA2NDQgJHtST09UX0ZTfSAiJHtST09URlNESVJ9Ii9yb290ZnMuaW1nCisKKwkjIHN5bmMg
dG8gYmUgc2FmZQorCXN5bmMKKworCSMgdW5tb3VudCAKKwlzdWRvIHVtb3VudCAiJHtST09URlNE
SVJ9IgorCisJIyB1bm1vbnQgdGhlc2UgcGFydGl0aW9ucworCXN1ZG8ga3BhcnR4IC1kc3YgIiR7
SERESU1HfSIKKworCSMgd2UncmUgcmVhZHkKK30KKwogYnVpbGRfaGRkaW1nKCkgewogCSMgQ3Jl
YXRlIGFuIEhERCBpbWFnZQogCWlmIFsgIiR7Tk9IRER9IiAhPSAiMSIgXSA7IHRoZW4KLQkJcG9w
dWxhdGUgJHtIRERESVJ9CisJCXBvcHVsYXRlICR7SERERElSfSAke1NFUEFSQVRFX1JPT1RGU30K
IAogCQlpZiBbICIke1BDQklPU30iID0gIjEiIF07IHRoZW4KIAkJCXN5c2xpbnV4X2hkZGltZ19w
b3B1bGF0ZSAke0hERERJUn0KQEAgLTIzNywxNCArMzE1LDI4IEBAIGJ1aWxkX2hkZGltZygpIHsK
IAkJCWVmaV9oZGRpbWdfcG9wdWxhdGUgJHtIRERESVJ9CiAJCWZpCiAKLQkJYnVpbGRfZmF0X2lt
ZyAke0hERERJUn0gJHtERVBMT1lfRElSX0lNQUdFfS8ke0lNQUdFX05BTUV9LmhkZGltZworCQkj
IGNyZWF0ZSBGQVQgaW4gYSBzZXBhcmF0ZSBpbWFnZSBmaWxlIHdoZW4gYnVpbGRpbmcgdHdvIHBh
cnRpdGlvbnMKKwkJaWYgWyAiJHtTRVBBUkFURV9ST09URlN9IiA9ICIxIiBdOyB0aGVuCisJCQlG
QVRfSU1BR0U9IiR7REVQTE9ZX0RJUl9JTUFHRX0vJHtJTUFHRV9OQU1FfS5mYXRpbWciCisJCWVs
c2UKKwkJCUZBVF9JTUFHRT0iJHtERVBMT1lfRElSX0lNQUdFfS8ke0lNQUdFX05BTUV9LmhkZGlt
ZyIKKwkJZmkKKworCQkjIGJ1aWxkIEZBVCBxaXRoIGEgYm9vdGxvYWRlciBmaXJzdAorCQlidWls
ZF9mYXRfaW1nICR7SERERElSfSAke0ZBVF9JTUFHRX0KIAogCQlpZiBbICIke1BDQklPU30iID0g
IjEiIF07IHRoZW4KLQkJCXN5c2xpbnV4X2hkZGltZ19pbnN0YWxsCisJCQlzeXNsaW51eF9oZGRk
aXJlY3RfaW5zdGFsbCAke0ZBVF9JTUFHRX0gJHtERVBMT1lfRElSX0lNQUdFfS8ke0lNQUdFX05B
TUV9LmhkZGltZworCQlmaQorCisJCSMgY29tYmluZSB0d28gaW1hZ2VzIGlmIG5lZWRlZAorCQlp
ZiBbICIke1NFUEFSQVRFX1JPT1RGU30iID0gIjEiIF07IHRoZW4KKwkJCWJ1aWxkX3R3b19wYXJ0
aXRpb25zICR7RkFUX0lNQUdFfSAke1JPT1RGU30gJHtERVBMT1lfRElSX0lNQUdFfS8ke0lNQUdF
X05BTUV9LmhkZGltZwogCQlmaQogCiAJCWNobW9kIDY0NCAke0RFUExPWV9ESVJfSU1BR0V9LyR7
SU1BR0VfTkFNRX0uaGRkaW1nCiAKKwkJIyBsaW5rIGdlbmVyaWMgbmFtZSB0byB0aGUgbGFzdGVz
dCBpbWFnZQogCQljZCAke0RFUExPWV9ESVJfSU1BR0V9CiAJCXJtIC1mICR7REVQTE9ZX0RJUl9J
TUFHRX0vJHtJTUFHRV9MSU5LX05BTUV9LmhkZGltZwogCQlsbiAtcyAke0lNQUdFX05BTUV9Lmhk
ZGltZyAke0RFUExPWV9ESVJfSU1BR0V9LyR7SU1BR0VfTElOS19OQU1FfS5oZGRpbWcKLS0gCjEu
OS4zCgo=

--001a11c269066a9325050a02f2a8--
