Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id E746965D11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 09:07:06 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id jz11so174433veb.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 02:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=4WG2GBokBbEg3Pmt2lZC4cgcwHarzGudXhuydufot5o=;
	b=IAS0xlyFh7uU1a/kLGyoXGWYrAVQ10+D08yPDzFBtQ9GacWYfcj3Pws33cyTm9Qm5T
	vQTxoJny+zjLnxU7TFrKhuSeajaxisMovUesWI4x+2hUz01qAbss0+t4lmvMJBCFEpMy
	Qk+yZqocMuVd4CKmCTT9ouq/Lb25Ap+j5niLHvJW+76pk9mN+MPsZuyN+lW4HCIEwqES
	l4PX7NGtW2X0h900wn/a6g5t1Q4buETyfu6hsovSDluRrCdAb34eqvPQ5eGZgWkHtbbn
	E5PLEC+ubZvlO7UqWPerEmLGGYsCkcTN/WyRZ22SH+IzeFr3qtgJPuYZ/jkFrHCPflAi
	sK9g==
MIME-Version: 1.0
X-Received: by 10.52.76.102 with SMTP id j6mr15129vdw.38.1397725626951; Thu,
	17 Apr 2014 02:07:06 -0700 (PDT)
Received: by 10.52.120.4 with HTTP; Thu, 17 Apr 2014 02:07:06 -0700 (PDT)
Date: Thu, 17 Apr 2014 11:07:06 +0200
Message-ID: <CALbNGRSqnLj6Hr+6dL0rcyacz1pXSf+XySbYs_tx_gnq5+QfEg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: issue with file-ownership in images
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
X-List-Received-Date: Thu, 17 Apr 2014 09:07:09 -0000
X-Groupsio-MsgNum: 52430
Content-Type: multipart/mixed; boundary=bcaec50162217d147f04f7395b12

--bcaec50162217d147f04f7395b12
Content-Type: text/plain; charset=UTF-8

Hi,

I know it is release-panic but at least for me this is an issue
causing lots of headaches.

Symptom:
In case a recipe changes ownership of files during install, file UIDs
& GIDs are found with incorrect values in image - at least for opkg
(this is what I have tested so far).

To investigate, I created an image containing polkit with the patch
attached. Polkit was chosen because it is not working: no rules are
analyzed due to missing access rights caused by wrong ownership.

log.do_rootfs shows:
| Installing polkit (0.112-r0) to root...
| Downloading file:/home/a.mueller/tmp/oe-core-eglibc/deploy/ipk/armv7at2hf-vfp-neon/polkit_0.112-r0_armv7at2hf-vfp-neon.ipk.
...
| update_unamecache returned false for polkitd UID: 995
...
| update_unamecache returned false for polkitd UID: 995
...
| Running useradd commands...
| NOTE: Performing useradd with [--root
/home/a.mueller/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce4-tiny-image/1.0-r0/rootfs
--system --no-create-home --user-group --home-dir /etc/polkit-1
polkitd] and 10 times of retry
| update_unamecache returned true for  UID: 0
...

The code creating this log is:
    if (update_unamecache(tar.formated.uname))
    {
        tar_entry->uid = uid_cache;
        opkg_msg(NOTICE,"update_unamecache returned true for %s UID:
%i\n", tar.formated.uname, tar_entry->uid);
    }
    else
    {
        tar_entry->uid = strtol(tar.formated.uid, NULL, 8);
        opkg_msg(NOTICE,"update_unamecache returned false for %s UID:
%i\n", tar.formated.uname, tar_entry->uid);
    }

Conclusion:
opkg sets file ownership during unpacking ipk. At this time the
users/groups are not found in the image since preinst has not run yet.
So opkg decides to set the UID/GID which were found during install as
fallback. These IDs are coming from sysroot and are different form
those found in the image. I checked: polkit has 995 in sysroot but
image ends up with 997 for polkit.

I did some attempts to change order of operations in opkg but these
did not lead to some improvement yet - and I have no idea if other
package-managers are affected too.

So anybody around with more experience and willing to take care or give hints?

Andreas

--bcaec50162217d147f04f7395b12
Content-Type: text/x-patch; charset=UTF-8; 
	name="0001-opkg-add-debug-messages-to-analyse-polkit-s-file-own.patch"
Content-Disposition: attachment; 
	filename="0001-opkg-add-debug-messages-to-analyse-polkit-s-file-own.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hu3shdi50

RnJvbSBhYjJkMWMwODczNTkxMTA0ZjUyMDhlZTU2YTAyODNmNDU5NGJhYWQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/QW5kcmVhcz0yME09QzM9QkNsbGVyPz0gPHNj
aG5pdHplbHRvbnlAZ29vZ2xlbWFpbC5jb20+CkRhdGU6IFRodSwgMTcgQXByIDIwMTQgMTA6MDc6
MTQgKzAyMDAKU3ViamVjdDogW1BBVENIXSBvcGtnOiBhZGQgZGVidWcgbWVzc2FnZXMgdG8gYW5h
bHlzZSBwb2xraXQncyBmaWxlIG93bmVyc2hpcAogaXNzdWUgaW4gcm9vdGZzCk1JTUUtVmVyc2lv
bjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRy
YW5zZmVyLUVuY29kaW5nOiA4Yml0CgpTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIE3DvGxsZXIgPHNj
aG5pdHplbHRvbnlAZ29vZ2xlbWFpbC5jb20+Ci0tLQogLi4uL29wa2cvMDAwMS11bmFyY2hpdmUt
Yy1hZGQtZGVidWctbWVzc2FnZXMucGF0Y2ggfCAzNCArKysrKysrKysrKysrKysrKysrKysrCiBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3BrZy9vcGtnXzAuMi4xLmJiICAgICAgICAgICB8ICAyICsr
CiAyIGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3BrZy9vcGtnLzAwMDEtdW5hcmNoaXZlLWMtYWRkLWRlYnVn
LW1lc3NhZ2VzLnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29wa2cv
b3BrZy8wMDAxLXVuYXJjaGl2ZS1jLWFkZC1kZWJ1Zy1tZXNzYWdlcy5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9vcGtnL29wa2cvMDAwMS11bmFyY2hpdmUtYy1hZGQtZGVidWctbWVzc2Fn
ZXMucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uMzYyNTkyNgotLS0g
L2Rldi9udWxsCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9vcGtnL29wa2cvMDAwMS11bmFy
Y2hpdmUtYy1hZGQtZGVidWctbWVzc2FnZXMucGF0Y2gKQEAgLTAsMCArMSwzNCBAQAorRnJvbSA4
MDMzNjU5ZjE3MGI3ZjQ1MTYyMTcyY2QzYTc2MWMzMTNkYjgwOWU1IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbTogPT9VVEYtOD9xP0FuZHJlYXM9MjBNPUMzPUJDbGxlcj89IDxzY2huaXR6
ZWx0b255QGdvb2dsZW1haWwuY29tPgorRGF0ZTogV2VkLCAxNiBBcHIgMjAxNCAxNzozMDozMSAr
MDIwMAorU3ViamVjdDogW1BBVENIXSB1bmFyY2hpdmUuYzogYWRkIGRlYnVnIG1lc3NhZ2VzCisK
Ky0tLQorIGxpYmJiL3VuYXJjaGl2ZS5jIHwgNyArKysrKysrCisgMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKQorCitkaWZmIC0tZ2l0IGEvbGliYmIvdW5hcmNoaXZlLmMgYi9saWJiYi91
bmFyY2hpdmUuYworaW5kZXggZDU4Mzc2Ny4uNDY1ODdkNSAxMDA2NDQKKy0tLSBhL2xpYmJiL3Vu
YXJjaGl2ZS5jCisrKysgYi9saWJiYi91bmFyY2hpdmUuYworQEAgLTU1NCwxMCArNTU0LDE3IEBA
IGdldF9oZWFkZXJfdGFyKEZJTEUgKnRhcl9zdHJlYW0pCisgKi8KKyAgICAgICAgIHRhcl9lbnRy
eS0+bW9kZSA9IDA3Nzc3ICYgc3RydG9sKHRhci5mb3JtYXRlZC5tb2RlLCBOVUxMLCA4KTsKKyAK
KysJCisgCWlmICh1cGRhdGVfdW5hbWVjYWNoZSh0YXIuZm9ybWF0ZWQudW5hbWUpKQorKwl7Cisg
CQl0YXJfZW50cnktPnVpZCA9IHVpZF9jYWNoZTsKKysJCW9wa2dfbXNnKE5PVElDRSwidXBkYXRl
X3VuYW1lY2FjaGUgcmV0dXJuZWQgdHJ1ZSBmb3IgJXMgVUlEOiAlaVxuIiwgdGFyLmZvcm1hdGVk
LnVuYW1lLCB0YXJfZW50cnktPnVpZCk7CisrCX0KKyAJZWxzZQorKwl7CisgCQl0YXJfZW50cnkt
PnVpZCA9IHN0cnRvbCh0YXIuZm9ybWF0ZWQudWlkLCBOVUxMLCA4KTsKKysJCW9wa2dfbXNnKE5P
VElDRSwidXBkYXRlX3VuYW1lY2FjaGUgcmV0dXJuZWQgZmFsc2UgZm9yICVzIFVJRDogJWlcbiIs
IHRhci5mb3JtYXRlZC51bmFtZSwgdGFyX2VudHJ5LT51aWQpOworKwl9CisgCWlmICh1cGRhdGVf
Z25hbWVjYWNoZSh0YXIuZm9ybWF0ZWQuZ25hbWUpKQorIAkJdGFyX2VudHJ5LT5naWQgPSBnaWRf
Y2FjaGU7CisgCWVsc2UKKy0tIAorMS44LjMuMQorCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvb3BrZy9vcGtnXzAuMi4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29wa2cv
b3BrZ18wLjIuMS5iYgppbmRleCAwOWMwY2NhLi5hODVhY2M2IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvb3BrZy9vcGtnXzAuMi4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9vcGtnL29wa2dfMC4yLjEuYmIKQEAgLTYsNiArNiw4IEBAIFNSQ19VUkkgPSAiaHR0cDov
L2Rvd25sb2Fkcy55b2N0b3Byb2plY3Qub3JnL3JlbGVhc2VzLyR7QlBOfS8ke0JQTn0tJHtQVn0u
dGFyLmd6CiAgICAgICAgICAgIGZpbGU6Ly9vcGtnLWNvbmZpZ3VyZS5zZXJ2aWNlIFwKICIKIAor
U1JDX1VSSV9hcHBlbmRfY2xhc3MtbmF0aXZlID0gImZpbGU6Ly8wMDAxLXVuYXJjaGl2ZS1jLWFk
ZC1kZWJ1Zy1tZXNzYWdlcy5wYXRjaCIKKwogUyA9ICIke1dPUktESVJ9LyR7QlBOfS0ke1BWfSIK
IAogU1JDX1VSSVttZDVzdW1dID0gIjE4ODFkMTcwYjlkZmJkN2VjZjBhYTQ2OGNiOTc3OWMwIgot
LSAKMS44LjMuMQoK

--bcaec50162217d147f04f7395b12--
