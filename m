Return-Path: <dariusz.pelowski@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 941136012A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 13:49:29 +0000 (UTC)
Received: by wmww144 with SMTP id w144so56311617wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 05:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=5kIoBldcHuyLOmzm9+ZIDBsv7UdJsSsKLSN43Fg5IfE=;
	b=Czl56ZPYSVge4MCEh1dBZHNS6fxOXLtGUApR48eAwXaq967jHpkCI5/Ztl6IggfnLn
	G0fqfDgYA/T7XtSlFepXpqgMKOrt6skTVOKHMXfkgPl3uJirUccYcnKZnNfRprIuFTX7
	JbKt0vCMpi0LEmMR7FCmXD5vUp2djgTzjSycufS+ZCV+PjNvO439mLKh1W6HOf9e+DS2
	DwGEP1Jzh0JtCL7uZGjjHG90hTNW6SGKY+mGD8avd8cfYTSJftaNbYH0ccCdxzXEMS7a
	yGjM0YVxIJcH/hivn0UW6z4wn/h5VQWgLgerfsws9Vhq04m5EJsWMccFiAkScbvfquQU
	w1GQ==
MIME-Version: 1.0
X-Received: by 10.194.243.170 with SMTP id wz10mr64344522wjc.80.1448632169630; 
	Fri, 27 Nov 2015 05:49:29 -0800 (PST)
Received: by 10.27.217.198 with HTTP; Fri, 27 Nov 2015 05:49:29 -0800 (PST)
Date: Fri, 27 Nov 2015 14:49:29 +0100
Message-ID: <CAJ73Ay7jNcfxyQdwjL0NR1G_6L5ME-Zty02kx9wfEGrnBz2ZpQ@mail.gmail.com>
From: Dariusz Pelowski <dariusz.pelowski@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Failing devshell
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
X-List-Received-Date: Fri, 27 Nov 2015 13:49:30 -0000
X-Groupsio-MsgNum: 74103
Content-Type: multipart/mixed; boundary=089e0149411ae22088052585f573

--089e0149411ae22088052585f573
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2015-11-26 18:25 GMT+01:00 Dariusz Pelowski <dariusz.pelowski@gmail.com>:
> I'm getting an error during execution of devshell:
> bitbake -c devshell  quilt-native
> WARNING: Host distribution "Arch-Linux" has not been validated with this
> version of the build system; you may possibly experience unexpected
> failures. It is recommended that you use a tested distribution.
> ...
> ERROR: Unable to spawn terminal auto: Execution of
> '/home/darekp/locale_test/tmp/work/x86_64-linux/quilt-native/0.64-r0/temp=
/run.do_terminal.18591'
> failed with exit code 1:
> Opcja =E2=80=9E-t=E2=80=9D nie jest ju=C5=BC obs=C5=82ugiwana w tej wersj=
i programu gnome-terminal.
> Przetworzenie parametr=C3=B3w si=C4=99 nie powiod=C5=82o: Opcja =E2=80=9E=
--disable-factory=E2=80=9D nie
> jest ju=C5=BC obs=C5=82ugiwana w tej wersji programu gnome-terminal.
> ERROR: Function failed: do_devshell
> ERROR: Logfile of failure stored in:
> /home/darekp/locale_test/tmp/work/x86_64-linux/quilt-native/0.64-r0/temp/=
log.do_devshell.18591
> ERROR: Task 3
> (/home/darekp/poky/meta/recipes-devtools/quilt/quilt-native_0.64.bb,
> do_devshell) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 4 tasks of which 3 didn't need to be rerun
> and 1 failed.
>
>
> The cause of the problem is the implementation of
> poky/meta/lib/oe/terminal.py. It expects that gnome-terminal --version wi=
ll
> return string starting from: "GNOME Terminal". But the returned string
> differs when locale is changes. This looks like this:
>
> [darekp@darekp ~]$ LANG=3DC gnome-terminal --version
> GNOME Terminal 3.18.2
>
> [darekp@darekp ~]$ LANG=3Dpl_PL.utf8 gnome-terminal --version
> Terminal GNOME 3.18.2
>
> The same problem affects other locales in gnome-terminal. I'm proposing t=
o
> fix this issue by setting LANG=3DC during execution of gnome-terminal
> --version.
>

Hi,

Described problem was discussed on yocto@yoctoproject.org mailing
list. Attached patch is fixing this issue, could you apply it? (I've
tested this change on all terminals calling changed function: GNOME
Terminal 3.18.2, Konsole: 15.08.0, tmux 2.1 and it worked correctly)

Thanks,
Dariusz

--089e0149411ae22088052585f573
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-lib-oe-terminal-use-C-locale-when-determining-versio.patch"
Content-Disposition: attachment; 
	filename="0001-lib-oe-terminal-use-C-locale-when-determining-versio.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ihhpwbs31

RnJvbSA4YjFmZmM3NmVhNWE0YjA4NjJmNGJhN2MwNzNkODBhYTJiNWJkNjAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEYXJpdXN6IFBlbG93c2tpIDxkYXJpdXN6LnBlbG93c2tpQGdt
YWlsLmNvbT4KRGF0ZTogVGh1LCAyNiBOb3YgMjAxNSAxNzo1OTo1MyArMDEwMApTdWJqZWN0OiBb
UEFUQ0hdIGxpYi9vZS90ZXJtaW5hbDogdXNlIEMgbG9jYWxlIHdoZW4gZGV0ZXJtaW5pbmcgdmVy
c2lvbgoKLS0tCiBtZXRhL2xpYi9vZS90ZXJtaW5hbC5weSB8IDQgKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvbGli
L29lL3Rlcm1pbmFsLnB5IGIvbWV0YS9saWIvb2UvdGVybWluYWwucHkKaW5kZXggYTRhOGM5Ny4u
MWVmYzA2ZCAxMDA2NDQKLS0tIGEvbWV0YS9saWIvb2UvdGVybWluYWwucHkKKysrIGIvbWV0YS9s
aWIvb2UvdGVybWluYWwucHkKQEAgLTI0NCw3ICsyNDQsOSBAQCBkZWYgY2hlY2tfdGVybWluYWxf
dmVyc2lvbih0ZXJtaW5hbE5hbWUpOgogICAgICAgICBjbWR2ZXJzaW9uID0gJyVzIC0tdmVyc2lv
bicgJSB0ZXJtaW5hbE5hbWUKICAgICAgICAgaWYgdGVybWluYWxOYW1lLnN0YXJ0c3dpdGgoJ3Rt
dXgnKToKICAgICAgICAgICAgIGNtZHZlcnNpb24gPSAnJXMgLVYnICUgdGVybWluYWxOYW1lCi0g
ICAgICAgIHAgPSBzdWIuUG9wZW4oWydzaCcsICctYycsIGNtZHZlcnNpb25dLCBzdGRvdXQ9c3Vi
LlBJUEUsc3RkZXJyPXN1Yi5QSVBFKQorICAgICAgICBuZXdlbnYgPSBvcy5lbnZpcm9uLmNvcHko
KQorICAgICAgICBuZXdlbnZbIkxBTkciXSA9ICJDIgorICAgICAgICBwID0gc3ViLlBvcGVuKFsn
c2gnLCAnLWMnLCBjbWR2ZXJzaW9uXSwgc3Rkb3V0PXN1Yi5QSVBFLCBzdGRlcnI9c3ViLlBJUEUs
IGVudj1uZXdlbnYpCiAgICAgICAgIG91dCwgZXJyID0gcC5jb21tdW5pY2F0ZSgpCiAgICAgICAg
IHZlcl9pbmZvID0gb3V0LnJzdHJpcCgpLnNwbGl0KCdcbicpCiAgICAgZXhjZXB0IE9TRXJyb3Ig
YXMgZXhjOgotLSAKMi42LjIKCg==

--089e0149411ae22088052585f573--
