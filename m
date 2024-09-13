Return-Path: <sam@liddicott.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4D9FC6182
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 21:52:33 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.84485.1726264350979847656
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Sep 2024 14:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@liddicott-com.20230601.gappssmtp.com header.s=20230601 header.b=AIXSgvZ9;
 spf=none, err=SPF record not found (domain: liddicott.com, ip: 209.85.208.53, mailfrom: sam@liddicott.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c42bcf35fbso32019a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 14:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=liddicott-com.20230601.gappssmtp.com; s=20230601; t=1726264349; x=1726869149; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5lWR7TkSq6R9TYhwVCz38IjW45CEKpi5A2HvbWOFS2w=;
        b=AIXSgvZ9nEWoEdfJccuBQY8rthxzfAObQAyBGMTP7TdyabnEQK+iBVgu7APaB0b6Og
         bF6FgX6hQifo3QPV3iVmvCD2AP0JQGf5EZZ3gzpsIEQ/S7jjgK+9UItR+IxLYguun7Vu
         30NT2eYb5snxa4irVKPDVF0kNzBAwJMiJf56XP+TALiJNh9RHqLvpVaM1KF4wN4tTbgx
         8wR//QOexEsamK/OjGnvERfFYhUQ+i/epj+ENRK9efD6n9SZYhE2ywr7IpcOTCBeUkWZ
         014C5UvumUnSTE6to+yMpnOGitOuNaMmhmnzMWUbmYxXO1brvH2NUn1EnCFNy4dTARnd
         ekhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726264349; x=1726869149;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5lWR7TkSq6R9TYhwVCz38IjW45CEKpi5A2HvbWOFS2w=;
        b=K9gRBlAhaN79RWo7hLBQ+srEmtiaX7E1lNjSeGYXvwUpoxonmHDA/a2zeBOKBf+hSQ
         Rx1tgyL2+ZrEJye3cKvQY9loHPjlnTClco1OKQpJ8UQB9qHmC2hxxTInepnuvi1BKD1z
         BT145r8ohHedalI6eRHG5vGnui41lA+bvLm2CpL9S/0d0+Puxas7ePo0yJNpNp129f5x
         w3Lh3ysoGC9uwxze812WXhWYkQCoCTnG55nWOEtCuRnboDytDaI+LHC8V38LRoM1Lci6
         M/bQ0Mm1Wy1VJBzRwBLj5MCKie9LUN2F1vx4Td3PKtmhGUOnkpvw1apL+qb19cM7Sveb
         DD6g==
X-Gm-Message-State: AOJu0YxY67rA7QmaJs1MK+Ds1r1KBRsXCH79wTiG56n/cX+gT+l0iTbR
	3LeKMYhQNCh4rufwJC1/HaF15qrfH1YRmV/yzGU3v73FpZ2U2R1sfLFV6e45FjOiChGQKx4fERm
	pVo/twEQowDtJ5DJtl8CFvTQP59avbuxgyRy3LdEPT+Y7gYbFVw==
X-Google-Smtp-Source: AGHT+IGDDjAJ/7bp5E5o7Euk+uCuu/tOzHvs2XLrrbEoeFA2o4vof9BeZeVWFRR9kEeoOHDCoE8QEzuB++2uIxoifFE=
X-Received: by 2002:a05:6402:1ecc:b0:5c4:2320:598f with SMTP id
 4fb4d7f45d1cf-5c423205f60mr2238814a12.20.1726264348338; Fri, 13 Sep 2024
 14:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAOj-5WCRbrpNsHMCox8k-sc3Dr604-pVTt5=iDjaXhf85Ha_Dg@mail.gmail.com>
In-Reply-To: <CAOj-5WCRbrpNsHMCox8k-sc3Dr604-pVTt5=iDjaXhf85Ha_Dg@mail.gmail.com>
From: Sam Liddicott <sam@liddicott.com>
Date: Fri, 13 Sep 2024 22:51:52 +0100
Message-ID: <CAOj-5WBC+ea6poeL9PBOW2rXYcYhUZm+h8ZZuEY6bJ1BBJr6yQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] fully fix kernel menuconfig shell composition
 fault in cml1.bbclass
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/mixed; boundary="00000000000045da1f0622073d01"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 21:52:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204488

--00000000000045da1f0622073d01
Content-Type: multipart/alternative; boundary="00000000000045da1b0622073dff"

--00000000000045da1b0622073dff
Content-Type: text/plain; charset="UTF-8"

TL;DR: Applying the Jaeyoon Jung patch (with fixups) to dunfell or thud
does not fix the core problem but breaks even more (thud and dunfell use '
), but the attached patches do.

I'm testing with extra config:
    KCONFIG_CONFIG_COMMAND_prepend=' X="1 2" '
    KCONFIG_CONFIG_COMMAND_prepend=" Y='a b' "
and then:
    bitbake virtual/kernel -c menuconfig

The result can then be examined by using ps to locate the make process, and
then
    tr '\0' '\n' < /proc/$PID/cmdline
and each line will show one of the "make" arguments, and it is easy to tell
whether multi-word arguments have been properly preserved and whether any
are missing.

I've also tested by adding a false target to KCONFIG_CONFIG_COMMAND
    KCONFIG_CONFIG_COMMAND_prepend=' zox X="1 2" '
    KCONFIG_CONFIG_COMMAND_prepend=" Y='a b' "
and ensured that it properly fails with:
    Command failed.
    Press any key to continue...

The biggest surprise was that without any patch, my
extra KCONFIG_CONFIG_COMMAND debug lines causes menuconfig to make the
kernel and skip menuconfig (because the command line was truncated), for
both thud and dunfell.

On thud and dunfell, a patch initially appears un-needed because (at least
in my setup) thud is using single quotes for KCONFIG_CONFIG_COMMAND:
    menuconfig HOSTLDFLAGS='-L.../...'
and so double quotes don't exist to terminate that string early. Of course,
that means they would both be broken by the original patch, or if double
quotes were used in a custom configuration.

I've attached a patch suitable for applying to thud, and another for
dunfell -- so that single or double quotes can be used.

Sam

--00000000000045da1b0622073dff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">TL;DR: Applying the Jaeyoon Jung patch (w=
ith fixups) to dunfell or thud does not fix the core problem but breaks eve=
n more (thud and dunfell use &#39; ), but the attached patches do.</div><di=
v dir=3D"ltr"><br></div><div dir=3D"ltr"><div>I&#39;m testing with extra co=
nfig:</div><div><font face=3D"monospace">=C2=A0 =C2=A0 KCONFIG_CONFIG_COMMA=
ND_prepend=3D&#39; X=3D&quot;1 2&quot; &#39;<br>=C2=A0 =C2=A0 KCONFIG_CONFI=
G_COMMAND_prepend=3D&quot; Y=3D&#39;a b&#39; &quot;<br></font></div><div di=
r=3D"ltr"><div>and then:</div><div><font face=3D"monospace">=C2=A0 =C2=A0 b=
itbake virtual/kernel -c menuconfig</font><br></div><div><br></div><div>The=
 result can then be examined by using ps to locate the make process, and th=
en</div><div><font face=3D"monospace">=C2=A0 =C2=A0 tr &#39;\0&#39; &#39;\n=
&#39; &lt; /proc/$PID/cmdline</font></div><div>and each line will show one =
of the &quot;make&quot; arguments, and it is easy to tell whether multi-wor=
d arguments have been properly preserved and whether any are missing.</div>=
</div></div><div dir=3D"ltr"><br></div><div>I&#39;ve also tested by adding =
a false target to=C2=A0<span style=3D"font-family:monospace">KCONFIG_CONFIG=
_COMMAND</span>=C2=A0</div><div><span style=3D"font-family:monospace">=C2=
=A0 =C2=A0 KCONFIG_CONFIG_COMMAND_prepend=3D&#39; zox X=3D&quot;1 2&quot; &=
#39;</span><br style=3D"font-family:monospace"><span style=3D"font-family:m=
onospace">=C2=A0 =C2=A0 KCONFIG_CONFIG_COMMAND_prepend=3D&quot; Y=3D&#39;a =
b&#39; &quot;</span><br></div><div>and ensured that it properly fails with:=
</div><div><font face=3D"monospace">=C2=A0 =C2=A0 Command failed.</font></d=
iv><div><font face=3D"monospace">=C2=A0 =C2=A0 Press any key to continue...=
</font><br></div><div><br></div><div>The biggest surprise was that without =
any patch, my extra=C2=A0KCONFIG_CONFIG_COMMAND debug lines causes menuconf=
ig to make the kernel and skip menuconfig (because the command line was tru=
ncated), for both thud and dunfell.<br></div><div><br></div><div>On thud an=
d dunfell, a patch initially appears un-needed=C2=A0because (at least in my=
 setup) thud is using single quotes for KCONFIG_CONFIG_COMMAND:<br></div><d=
iv dir=3D"ltr"><font face=3D"monospace">=C2=A0 =C2=A0 menuconfig HOSTLDFLAG=
S=3D&#39;-L.../...&#39;</font><br></div><div>and so double quotes don&#39;t=
 exist to terminate that string early. Of course, that means they would bot=
h be broken by the original patch, or if double quotes were used in a custo=
m configuration.</div><div><br></div><div>I&#39;ve attached a patch suitabl=
e for applying to thud, and another for dunfell -- so that single or double=
 quotes can be used.<br></div><div><br></div><div>Sam</div><div><br></div><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
</blockquote></div></div>

--00000000000045da1b0622073dff--

--00000000000045da1f0622073d01
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="DUNFELL-avoid-the-need-to-escape-KCONFIG_CONFIG_COMMAND-for-.patch"
Content-Disposition: attachment; 
	filename="DUNFELL-avoid-the-need-to-escape-KCONFIG_CONFIG_COMMAND-for-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m1193z960>
X-Attachment-Id: f_m1193z960

RnJvbSBhOGU4NDdjMzA3M2ZiMzgwYTJlMzVmY2VhMTk5NGExN2JhNjhmYWYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTYW0gTGlkZGljb3R0IDxzYW1AbGlkZGljb3R0LmNvbT4KRGF0
ZTogVGh1LCAxMiBTZXAgMjAyNCAxNzoxODozNyArMDEwMApTdWJqZWN0OiBbZHVuZmVsbF0gYXZv
aWQgdGhlIG5lZWQgdG8gZXNjYXBlIEtDT05GSUdfQ09ORklHX0NPTU1BTkQgZm9yIGRvX21lbnVj
b25maWcKCkFsdGhvdWdoIEtDT05GSUdfQ09ORklHX0NPTU1BTkQgaXMgc2hlbGwtcmVhZHksIGl0
IG5lZWRzIGVzY2FwaW5nCndoZW4gY29tcG9zZWQgYXMgcGFydCBvZiBzb21lIHNoZWxsIHdoaWNo
IGlzIHRoZW4gZW1iZWRkZWQgaW50byBhbiAKb3V0ZXIgInNoIC1jIiBpbiBjbWwxLmJiY2xhc3MK
ClRoaXMgcGF0Y2ggYXZvaWRzIHRoZSBuZWVkIHRvIGVzY2FwZSBLQ09ORklHX0NPTkZJR19DT01N
QU5EIGJ5IGluc2VydGluZwppdCBpbnRvIHRoZSBvdXRlciAic2ggLWMiIGFuZCBwYXNzaW5nIGl0
IGZyb20gdGhlcmUgYXMgb3B0aW9uYWwgYXJncwp3aXRoIGEgZHVtbXkgYXJnMAoKU2lnbmVkLW9m
Zi1ieTogU2FtIExpZGRpY290dCA8c2FtQGxpZGRpY290dC5jb20+Ci0tLQogbWV0YS9jbGFzc2Vz
L2NtbDEuYmJjbGFzcyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9jbWwxLmJiY2xhc3MgYi9tZXRh
L2NsYXNzZXMvY21sMS5iYmNsYXNzCmluZGV4IGQzMTlkNjZhYjIuLjBkYmFmMjViOGUgMTAwNjQ0
Ci0tLSBhL21ldGEvY2xhc3Nlcy9jbWwxLmJiY2xhc3MKKysrIGIvbWV0YS9jbGFzc2VzL2NtbDEu
YmJjbGFzcwpAQCAtNDgsMyArNDgsMyBAQCBweXRob24gZG9fbWVudWNvbmZpZygpIHsKIAotICAg
IG9lX3Rlcm1pbmFsKCJzaCAtYyBcIm1ha2UgJXM7IGlmIFsgXFwkPyAtbmUgMCBdOyB0aGVuIGVj
aG8gJ0NvbW1hbmQgZmFpbGVkLic7IHByaW50ZiAnUHJlc3MgYW55IGtleSB0byBjb250aW51ZS4u
LiAnOyByZWFkIHI7IGZpXCIiICUgZC5nZXRWYXIoJ0tDT05GSUdfQ09ORklHX0NPTU1BTkQnKSwK
KyAgICBvZV90ZXJtaW5hbCgic2ggLWMgJ21ha2UgXCIkQFwiIDsgaWYgWyAkPyAtbmUgMCBdOyB0
aGVuIGVjaG8gXCJDb21tYW5kIGZhaWxlZC5cIjsgcHJpbnRmIFwiUHJlc3MgYW55IGtleSB0byBj
b250aW51ZS4uLiBcIjsgcmVhZCByOyBmaScgb2VfdGVybWluYWwtY21kICVzICIgJSBkLmdldFZh
cignS0NPTkZJR19DT05GSUdfQ09NTUFORCcpLAogICAgICAgICAgICAgICAgIGQuZ2V0VmFyKCdQ
TicpICsgJyBDb25maWd1cmF0aW9uJywgZCkKLS0gCjIuNDMuMAo=
--00000000000045da1f0622073d01
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="THUD-avoid-the-need-to-escape-KCONFIG_CONFIG_COMMAND-for-.patch"
Content-Disposition: attachment; 
	filename="THUD-avoid-the-need-to-escape-KCONFIG_CONFIG_COMMAND-for-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m1196e9v1>
X-Attachment-Id: f_m1196e9v1

RnJvbSBhOGU4NDdjMzA3M2ZiMzgwYTJlMzVmY2VhMTk5NGExN2JhNjhmYWYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTYW0gTGlkZGljb3R0IDxzYW1AbGlkZGljb3R0LmNvbT4KRGF0
ZTogVGh1LCAxMiBTZXAgMjAyNCAxNzoxODozNyArMDEwMApTdWJqZWN0OiBhdm9pZCB0aGUgbmVl
ZCB0byBlc2NhcGUgS0NPTkZJR19DT05GSUdfQ09NTUFORCBmb3IgZG9fbWVudWNvbmZpZwoKQWx0
aG91Z2ggS0NPTkZJR19DT05GSUdfQ09NTUFORCBpcyBzaGVsbC1yZWFkeSwgaXQgbmVlZHMgZXNj
YXBpbmcKd2hlbiBjb21wb3NlZCBhcyBwYXJ0IG9mIHNvbWUgc2hlbGwgd2hpY2ggaXMgdGhlbiBl
bWJlZGRlZCBpbnRvIGFuIApvdXRlciAic2ggLWMiIGluIGNtbDEuYmJjbGFzcwoKVGhpcyBwYXRj
aCBhdm9pZHMgdGhlIG5lZWQgdG8gZXNjYXBlIEtDT05GSUdfQ09ORklHX0NPTU1BTkQgYnkgaW5z
ZXJ0aW5nCml0IGludG8gdGhlIG91dGVyICJzaCAtYyIgYW5kIHBhc3NpbmcgaXQgZnJvbSB0aGVy
ZSBhcyBvcHRpb25hbCBhcmdzCndpdGggYSBkdW1teSBhcmcwCgpTaWduZWQtb2ZmLWJ5OiBTYW0g
TGlkZGljb3R0IDxzYW1AbGlkZGljb3R0LmNvbT4KLS0tCiBtZXRhL2NsYXNzZXMvY21sMS5iYmNs
YXNzIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzL2NtbDEuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy9j
bWwxLmJiY2xhc3MKaW5kZXggZDMxOWQ2NmFiMi4uMGRiYWYyNWI4ZSAxMDA2NDQKLS0tIGEvbWV0
YS9jbGFzc2VzL2NtbDEuYmJjbGFzcworKysgYi9tZXRhL2NsYXNzZXMvY21sMS5iYmNsYXNzCkBA
IC00OCwzICs0OCwzIEBAIHB5dGhvbiBkb19tZW51Y29uZmlnKCkgewogCi0gICAgb2VfdGVybWlu
YWwoIiR7U0hFTEx9IC1jIFwibWFrZSAlczsgaWYgWyBcJD8gLW5lIDAgXTsgdGhlbiBlY2hvICdD
b21tYW5kIGZhaWxlZC4nOyBwcmludGYgJ1ByZXNzIGFueSBrZXkgdG8gY29udGludWUuLi4gJzsg
cmVhZCByOyBmaVwiIiAlIGQuZ2V0VmFyKCdLQ09ORklHX0NPTkZJR19DT01NQU5EJyksCisgICAg
b2VfdGVybWluYWwoIiR7U0hFTEx9IC1jICdtYWtlIFwiJEBcIiA7IGlmIFsgJD8gLW5lIDAgXTsg
dGhlbiBlY2hvIFwiQ29tbWFuZCBmYWlsZWQuXCI7IHByaW50ZiBcIlByZXNzIGFueSBrZXkgdG8g
Y29udGludWUuLi4gXCI7IHJlYWQgcjsgZmknIG9lX3Rlcm1pbmFsLWNtZCAlcyAiICUgZC5nZXRW
YXIoJ0tDT05GSUdfQ09ORklHX0NPTU1BTkQnKSwKICAgICAgICAgICAgICAgICBkLmdldFZhcign
UE4nKSArICcgQ29uZmlndXJhdGlvbicsIGQpCi0tIAoyLjQzLjAK
--00000000000045da1f0622073d01--

