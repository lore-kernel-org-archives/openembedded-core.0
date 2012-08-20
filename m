Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T3T2H-00009r-Ue
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 16:32:58 +0200
Received: by iaky10 with SMTP id y10so2773509iak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 07:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=gjXej3ODJgEZv+xe1gjYVqMLeV3NarIBpuUhqX3+8fU=;
	b=czSnbQ7qpIKkjBcvmm+j7kFl9pJJNM3lj84bNsIQtzkl29yLX6dQ1Tz0ARtdmqUch7
	9JzUvJpLB7eOLlDZzH1qvMJ3qc5R/Nvmje7X7qsK/aS1r5hcnQQxdRzOGwojrasZ6IQC
	jjJFeqGiTcE5ZKEoLiNgkkb1I5pPnOcznfDHaCYyqrZ9EuAdqT4cz/giw1/qW+RzaE9/
	uPLc+B1ZZxg5i/P9+rE/Zzc43FCO5Wz5lVzu0ZkyYvwThtHznY7rZvrpaHkcBc6QDT0y
	puVfbl5iVAaqxBZZH6rlHBBz9jSV3ziMoFVSheQrM8I0xTr/ovKOt3HMfHps9CvhHW4O
	8MIQ==
MIME-Version: 1.0
Received: by 10.50.191.165 with SMTP id gz5mr9941263igc.50.1345472454857; Mon,
	20 Aug 2012 07:20:54 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Mon, 20 Aug 2012 07:20:54 -0700 (PDT)
In-Reply-To: <CALbNGRSyCyCSX23dQXa1neOBior_vHbmKtk8SmSV8pKJdQt44w@mail.gmail.com>
References: <CALbNGRSyCyCSX23dQXa1neOBior_vHbmKtk8SmSV8pKJdQt44w@mail.gmail.com>
Date: Mon, 20 Aug 2012 16:20:54 +0200
Message-ID: <CALbNGRS50yfrmMYUzbCGYykQq25N208UY4k_AMtkrakhGYb0pw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Re: pango modules postinst issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2012 14:32:58 -0000
X-Groupsio-MsgNum: 27890
Content-Type: multipart/mixed; boundary=14dae934075bba121604c7b337d2

--14dae934075bba121604c7b337d2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2012 at 5:01 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> Hi,
>
> sorry fur disturbing again - but:
>
> When starting X on a maiden image I receive:
>
> No builtin or dynamically loaded modules were found.
> PangoFc will not work correctly.
> This probably means there was an error in the creation of:
>   '/etc/pango/pango.modules'
> You should create this file by running:
>   pango-querymodules > '/etc/pango/pango.modules'
>
> and have no fonts displayed. Followed the suggestion
>
> pango-querymodules > '/etc/pango/pango.modules'
>
> -> fonts are OK.
>
> I checked: Besides other pango modules my image contains
> pango-module-basic-x. In the postinst of this package I see
>
> #!/bin/sh
> if [ "x$D" !=3D "x" ]; then
>   exit 1
> fi
>
> if ! [ -e $D/etc/pango ] ; then
>         mkdir -p $D/etc/pango
> fi
> /usr/bin/pango-querymodules > /etc/pango/pango.modules
>
> This looks OK so far ( besides that I would not have the $D in second par=
t ).
>
> Additionally log.do_rootfs says:
>
> Configuring pango-module-basic-x.
> pango-module-basic-x.postinst returned 1, marking as unpacked only,
> configuration required on target.
>
> Any idea what is happening here?
>
I investigated this and found oe-core commit
ffe93e2a099e4cadb1829dc12a58a6d7bef9a5a7 for opkg-collateral. Besides
changing the configuration location it changes

-lists_dir ext /var/lib/ipkg
+lists_dir ext /var/lib/opkg

The patch attached for meta-angstrom fixes the pango-postinst issue
but I am not quite sure if this is a good solution, because it
reinvents parts of opkg-collateral. Why does angstrom replace
opkg-collateral? Wouldn't it be a better solution to append
opkg-collateral with angstrom feeds packages?

Andreas

--14dae934075bba121604c7b337d2
Content-Type: application/octet-stream; 
	name="0001-angstrom-feed-configs-add-opkg.conf-from-oe-core-opk.patch"
Content-Disposition: attachment; 
	filename="0001-angstrom-feed-configs-add-opkg.conf-from-oe-core-opk.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h63nhjdr0

RnJvbSA5N2E2NTc4YjVlYmE1ODNmYTA0NjAzZTk4ZDkyOTEzNGYzNjc2M2M5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/QW5kcmVhcz0yME09QzM9QkNsbGVyPz0gPHNj
aG5pdHplbHRvbnlAZ29vZ2xlbWFpbC5jb20+CkRhdGU6IE1vbiwgMjAgQXVnIDIwMTIgMTY6MTU6
MTYgKzAyMDAKU3ViamVjdDogW21ldGEtYW5nc3Ryb21dIGFuZ3N0cm9tLWZlZWQtY29uZmlnczog
YWRkIG9wa2cuY29uZiBmcm9tIG9lLWNvcmUKIG9wa2ctY29sbGF0ZXJhbApNSU1FLVZlcnNpb246
IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFu
c2Zlci1FbmNvZGluZzogOGJpdAoKClNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgTcO8bGxlciA8c2No
bml0emVsdG9ueUBnb29nbGVtYWlsLmNvbT4KLS0tCiByZWNpcGVzLWFuZ3N0cm9tL2FuZ3N0cm9t
L2FuZ3N0cm9tLWZlZWQtY29uZmlncy5iYiB8ICAgIDcgKysrKy0KIC4uLi9hbmdzdHJvbS9hbmdz
dHJvbS1mZWVkLWNvbmZpZ3Mvb3BrZy5jb25mICAgICAgIHwgICAyOSArKysrKysrKysrKysrKysr
KysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9ucygtKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMtYW5nc3Ryb20vYW5nc3Ryb20vYW5nc3Ryb20tZmVl
ZC1jb25maWdzL29wa2cuY29uZgoKZGlmZiAtLWdpdCBhL3JlY2lwZXMtYW5nc3Ryb20vYW5nc3Ry
b20vYW5nc3Ryb20tZmVlZC1jb25maWdzLmJiIGIvcmVjaXBlcy1hbmdzdHJvbS9hbmdzdHJvbS9h
bmdzdHJvbS1mZWVkLWNvbmZpZ3MuYmIKaW5kZXggOTNjMWU3MS4uYmYxYjI3NSAxMDA2NDQKLS0t
IGEvcmVjaXBlcy1hbmdzdHJvbS9hbmdzdHJvbS9hbmdzdHJvbS1mZWVkLWNvbmZpZ3MuYmIKKysr
IGIvcmVjaXBlcy1hbmdzdHJvbS9hbmdzdHJvbS9hbmdzdHJvbS1mZWVkLWNvbmZpZ3MuYmIKQEAg
LTMsOSArMywxMSBAQCBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
LyR7Q09SRUJBU0V9L0xJQ0VOU0U7bWQ1PTNmNDBkNzk5NDM5NzEwOTI4NWVjN2I4MWZkZWIzYjU4
IgogCiAjUFYgPSAiJHtESVNUUk9fVkVSU0lPTn0iCi1QUiA9ICJyMTYiCitQUiA9ICJyMTciCiBQ
QUNLQUdFX0FSQ0ggPSAiJHtNQUNISU5FX0FSQ0h9IgogCitTUkNfVVJJID0gImZpbGU6Ly9vcGtn
LmNvbmYiCisKIEZFRURfQkFTRVBBVEggPz0gInVuc3RhYmxlL2ZlZWQvIgogCiBJV01NWFRfRkVF
RCA9ICIke0BiYXNlX2NvbnRhaW5zKCdNQUNISU5FX0ZFQVRVUkVTJywgJ2l3bW14dCcsICdpd21t
eHQnLCAnJyxkKX0iCkBAIC0zNiw2ICszOCw3IEBAIGRvX2NvbXBpbGUoKSB7CiBkb19pbnN0YWxs
ICgpIHsKIAlpbnN0YWxsIC1kICR7RH0ke3N5c2NvbmZkaXJ9L29wa2cKIAlpbnN0YWxsIC1tIDA2
NDQgICR7U30vJHtzeXNjb25mZGlyfS9vcGtnLyogJHtEfSR7c3lzY29uZmRpcn0vb3BrZy8KKwlp
bnN0YWxsIC1tIDA2NDQgICR7V09SS0RJUn0vb3BrZy5jb25mICR7RH0vJHtzeXNjb25mZGlyfS9v
cGtnCiB9CiAKIEZJTEVTXyR7UE59ID0gIiR7c3lzY29uZmRpcn0vb3BrZy9iYXNlLWZlZWQuY29u
ZiBcCkBAIC00Nyw2ICs1MCw3IEBAIEZJTEVTXyR7UE59ID0gIiR7c3lzY29uZmRpcn0vb3BrZy9i
YXNlLWZlZWQuY29uZiBcCiAJCQkJCSR7c3lzY29uZmRpcn0vb3BrZy9ub2FyY2gtZmVlZC5jb25m
IFwKIAkJCQkJJHtzeXNjb25mZGlyfS9vcGtnL2l3bW14dC1mZWVkLmNvbmYgXAogCQkJCQkke3N5
c2NvbmZkaXJ9L29wa2cvc2RrLWZlZWQuY29uZiBcCisJCQkJCSR7c3lzY29uZmRpcn0vb3BrZy9v
cGtnLmNvbmYgXAogCQkJCQkiCiAKIENPTkZGSUxFU18ke1BOfSArPSAiJHtzeXNjb25mZGlyfS9v
cGtnL2Jhc2UtZmVlZC5jb25mIFwKQEAgLTU3LDYgKzYxLDcgQEAgQ09ORkZJTEVTXyR7UE59ICs9
ICIke3N5c2NvbmZkaXJ9L29wa2cvYmFzZS1mZWVkLmNvbmYgXAogCQkJCQkke3N5c2NvbmZkaXJ9
L29wa2cvJHtNQUNISU5FX0FSQ0h9LWZlZWQuY29uZiBcCiAJCQkJCSR7c3lzY29uZmRpcn0vb3Br
Zy9ub2FyY2gtZmVlZC5jb25mIFwKIAkJCQkJJHtzeXNjb25mZGlyfS9vcGtnL3Nkay1mZWVkLmNv
bmYgXAorCQkJCQkke3N5c2NvbmZkaXJ9L29wa2cvb3BrZy5jb25mIFwKIAkJCQkJIgogCiAjIEdl
dCByaWQgb2Ygb3BrZy1jb2xsYXRlcmFsCmRpZmYgLS1naXQgYS9yZWNpcGVzLWFuZ3N0cm9tL2Fu
Z3N0cm9tL2FuZ3N0cm9tLWZlZWQtY29uZmlncy9vcGtnLmNvbmYgYi9yZWNpcGVzLWFuZ3N0cm9t
L2FuZ3N0cm9tL2FuZ3N0cm9tLWZlZWQtY29uZmlncy9vcGtnLmNvbmYKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMC4uNWRkOGJmZgotLS0gL2Rldi9udWxsCisrKyBiL3JlY2lwZXMt
YW5nc3Ryb20vYW5nc3Ryb20vYW5nc3Ryb20tZmVlZC1jb25maWdzL29wa2cuY29uZgpAQCAtMCww
ICsxLDI5IEBACisjIE11c3QgaGF2ZSBvbmUgb3IgbW9yZSBzb3VyY2UgZW50cmllcyBvZiB0aGUg
Zm9ybToKKyMKKyMgICBzcmMgPHNyYy1uYW1lPiA8c291cmNlLXVybD4KKyMKKyMgYW5kIG9uZSBv
ciBtb3JlIGRlc3RpbmF0aW9uIGVudHJpZXMgb2YgdGhlIGZvcm06CisjCisjICAgZGVzdCA8ZGVz
dC1uYW1lPiA8dGFyZ2V0LXBhdGg+CisjCisjIHdoZXJlIDxzcmMtbmFtZT4gYW5kIDxkZXN0LW5h
bWVzPiBhcmUgaWRlbnRpZmllcnMgdGhhdAorIyBzaG91bGQgbWF0Y2ggW2EtekEtWjAtOS5fLV0r
LCA8c291cmNlLXVybD4gc2hvdWxkIGJlIGEKKyMgVVJMIHRoYXQgcG9pbnRzIHRvIGEgZGlyZWN0
b3J5IGNvbnRhaW5pbmcgYSBGYW1pbGlhcgorIyBQYWNrYWdlcyBmaWxlLCBhbmQgPHRhcmdldC1w
YXRoPiBzaG91bGQgYmUgYSBkaXJlY3RvcnkKKyMgdGhhdCBleGlzdHMgb24gdGhlIHRhcmdldCBz
eXN0ZW0uCisKKyMgUHJveHkgU3VwcG9ydAorI29wdGlvbiBodHRwX3Byb3h5IGh0dHA6Ly9wcm94
eS50bGQ6MzEyOAorI29wdGlvbiBmdHBfcHJveHkgaHR0cDovL3Byb3h5LnRsZDozMTI4Cisjb3B0
aW9uIHByb3h5X3VzZXJuYW1lIDx1c2VybmFtZT4KKyNvcHRpb24gcHJveHlfcGFzc3dvcmQgPHBh
c3N3b3JkPgorCisjIEVuYWJsZSBHUEdNRSBzaWduYXR1cmUKKyMgb3B0aW9uIGNoZWNrX3NpZ25h
dHVyZSAxCisKKyMgT2ZmbGluZSBtb2RlIChmb3IgdXNlIGluIGNvbnN0cnVjdGluZyBmbGFzaCBp
bWFnZXMgb2ZmbGluZSkKKyNvcHRpb24gb2ZmbGluZV9yb290IHRhcmdldAorCitkZXN0IHJvb3Qg
LworbGlzdHNfZGlyIGV4dCAvdmFyL2xpYi9vcGtnCisKLS0gCjEuNy42LjUKCg==

--14dae934075bba121604c7b337d2--
