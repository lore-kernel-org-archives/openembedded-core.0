Return-Path: <sam@liddicott.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03487EED61E
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 16:24:44 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.52289.1726158276489963716
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 09:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@liddicott-com.20230601.gappssmtp.com header.s=20230601 header.b=XAPXnCij;
 spf=none, err=SPF record not found (domain: liddicott.com, ip: 209.85.208.181, mailfrom: sam@liddicott.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f75c205e4aso14476951fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 09:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=liddicott-com.20230601.gappssmtp.com; s=20230601; t=1726158273; x=1726763073; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fN0hGl4NWW2Q2pMnWJsul8OWjBM46WYszEVin2mUyyc=;
        b=XAPXnCijl6HqF7H66ZUeQCw3nSGh+A35uZ6h7MiVkFtHUJmD312H5w15vuIjeHIjwf
         sI2M5qpz0jeMgAFJbLV3yDxooDuUCmwHqr5IUXl+yujIG1vGsjR9bvocol95cAV+JA/x
         CDprTA+i6p3fh97F72p/nBIRI3npSicb5euBtQ8vQCUnZVTYBLvObxIEgyYcKiNXgxTO
         WPR6KwboHBLYjmpnYs17eOMSavlYCuflULtw3c0B51hIb8/QP24xE/npzmRqs+E9tscz
         ROghPiWukFBm2K95BpewQa8ubpxewCpQb+xuZobaolkJDe8ONfqGfBJM3o/SPlXPYzYt
         yevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726158273; x=1726763073;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fN0hGl4NWW2Q2pMnWJsul8OWjBM46WYszEVin2mUyyc=;
        b=pgLCElGjwvarczpAA/CRISYQTg/vzh5ffTHkMmEz+o6YhG3EEXNAI7olhMDOdDIOPM
         QlX0CHtdM/V4SzNxkODaOeZQETA6IAAJuTdWK68BG25eMHEP7+4UaBCI5nq/URDQFXF7
         eKlrcsBk6L7u6bIBzmPJl7J2ZT/lyu1as3Q72X6tDlAhB5mA8vjp7ThLp61X9OW+4JbY
         +Zo0//PsviQqALt0bEj8JlVWFpsaDMw28aWDLyAEjFXc5XeTj9HngYdULg+2gnSXZemb
         cUh6I58Z8GkaXw6TlIbafje+jHUo7O/BWo14E02zwAAlaAH7MjGylpnzGGEWzH9FQvOQ
         XCiA==
X-Gm-Message-State: AOJu0YzZZbF33eb1WbUfkPsCDVdE+v9Yn5OZlDqqYSSC6JQibVRFU8s2
	LuuoyO2FD6fvvdSeIVueV8iaWUmNKffGYrR3QV93gPTrHQrMtbQjm91hi8MIW8qCV5eFdJbwL+s
	q7kEBfE4NMuZgdeWHoVioj069D0A1jZ352Uv2p5+CQwESEhtfaQ==
X-Google-Smtp-Source: AGHT+IG9UyemFkYqDRdoO1gNcBE0XpoBzyLH5IghwwmeNSLt9VvYpfomAPPG+0gYBsCDBxiBSthkcyDPwqrf6qFNJ4Y=
X-Received: by 2002:a2e:be83:0:b0:2f7:503e:ed43 with SMTP id
 38308e7fff4ca-2f787edf4a8mr22030471fa.26.1726158272885; Thu, 12 Sep 2024
 09:24:32 -0700 (PDT)
MIME-Version: 1.0
From: Sam Liddicott <sam@liddicott.com>
Date: Thu, 12 Sep 2024 17:23:56 +0100
Message-ID: <CAOj-5WCRbrpNsHMCox8k-sc3Dr604-pVTt5=iDjaXhf85Ha_Dg@mail.gmail.com>
Subject: [OE-core][PATCH] fully fix kernel menuconfig shell composition fault
 in cml1.bbclass
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/mixed; boundary="000000000000af55f20621ee8ad9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 16:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204448

--000000000000af55f20621ee8ad9
Content-Type: multipart/alternative; boundary="000000000000af55f10621ee8ad7"

--000000000000af55f10621ee8ad7
Content-Type: text/plain; charset="UTF-8"

I mistakenly posted bad patches to bitbake-devel earlier today.

These are 2 alternative patches (pick only one). They apply on master
branch but should backport easily. I tested them and generated them on
kirkstone (and then updated the path and checked application on master).

This is a full fix for a problem partially addressed by Jaeyoon Jung (
jaeyoon.jung@lge.com Thu Sep 21 17:27:10 2023 +0200
https://lists.openembedded.org/g/openembedded-core/message/186885)

That fix swapped " for ' which instead causes the failure to occur when
KCONFIG_CONFIG_COMMAND contained ' (single quotes) whereas before it
occurred when KCONFIG_CONFIG_COMMAND contained " (double quotes).

The problem only arises because of the extra "sh -c" needed in cml1.bbclass
to execute multiple shell statements, and because of the existence of a
prepended "exec" by terminal.bbclass function emit_terminal_func.

This means that the implicitly shell-ready KCONFIG_CONFIG_COMMAND needs
escaping for insertion into the extra "sh -c". Although cml1.bbclass
escaped the shell code in the source, the KCONFIG_CONFIG_COMMAND was not
escaped, and so either " or ' was going to fall victim at some point.

These two alternative patches directly address the need to escape
KCONFIG_CONFIG_COMMAND.

The first patch is the simplest, and causes KCONFIG_CONFIG_COMMAND to be
passed as additional arguments to the inner "sh -c", entirely avoiding the
need to shell escape, on this principle:

    -"sh -c 'make %s ...'" % ${KCONFIG_CONFIG_COMMAND}"
    +"sh -c 'make \"$@\" ...' dummy-arg0 %s" % ${KCONFIG_CONFIG_COMMAND}

The second fix uses shlex.quote (suitable for python 3.3 or above) to quote
the entire argument to "sh -c" including KCONFIG_CONFIG_COMMAND, avoiding
also the need to manually escape any of the nested shell.

I think that the first fix is more portable, but they both require scrutiny
to ensure fixing the problem properly is worth the trouble.

For application in kirkstone and some
others, meta/classes-recipe/cml1.bbclass needs changing to
meta/classes/cml1.bbclass

I know that we have a good-enough-for-now fix from Jaeyoon Jung, so this
isn't urgent, and maybe not even important.

Sam

--000000000000af55f10621ee8ad7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>I mistakenly posted bad patches to b=
itbake-devel earlier today.</div><div><br></div><div>These are 2 alternativ=
e=C2=A0patches (pick only one). They apply on master branch but should back=
port easily. I tested them and generated them on kirkstone (and then update=
d the path and checked application on master).<br></div><div><br></div><div=
>This is a full fix for a problem partially addressed by=C2=A0Jaeyoon Jung=
=C2=A0(<a href=3D"mailto:jaeyoon.jung@lge.com">jaeyoon.jung@lge.com</a> Thu=
 Sep 21 17:27:10 2023 +0200=C2=A0<a href=3D"https://lists.openembedded.org/=
g/openembedded-core/message/186885">https://lists.openembedded.org/g/openem=
bedded-core/message/186885</a>)</div><div><br></div><div>That fix swapped &=
quot; for &#39; which instead causes the failure to occur when KCONFIG_CONF=
IG_COMMAND contained &#39; (single quotes) whereas before it occurred when =
KCONFIG_CONFIG_COMMAND contained &quot; (double quotes).<br></div><div><br>=
</div><div>The problem only arises because of the extra &quot;sh -c&quot; n=
eeded in cml1.bbclass to execute multiple shell statements, and because of=
=C2=A0the existence of a prepended &quot;exec&quot; by terminal.bbclass fun=
ction=C2=A0emit_terminal_func.</div><div><br></div><div>This means that the=
 implicitly shell-ready KCONFIG_CONFIG_COMMAND needs escaping for insertion=
 into the extra &quot;sh -c&quot;. Although cml1.bbclass escaped the shell =
code in the source, the KCONFIG_CONFIG_COMMAND was not escaped, and so eith=
er &quot; or &#39; was going to fall victim at some point.</div><div><br></=
div><div>These two alternative patches directly address the need to escape =
KCONFIG_CONFIG_COMMAND.</div><div><br></div><div>The first patch is the sim=
plest,=C2=A0and causes=C2=A0KCONFIG_CONFIG_COMMAND to be passed as addition=
al arguments to the inner &quot;sh -c&quot;, entirely avoiding the need to =
shell escape, on this principle:<br><br></div><div><font face=3D"monospace"=
>=C2=A0 =C2=A0 -&quot;sh -c &#39;make %s ...&#39;&quot; %=C2=A0</font><font=
 face=3D"monospace">${</font>KCONFIG_CONFIG_COMMAND}&quot;</div><div><font =
face=3D"monospace">=C2=A0 =C2=A0 +&quot;sh -c &#39;make \&quot;$@\&quot; ..=
.&#39; dummy-arg0 %s&quot; % ${</font>KCONFIG_CONFIG_COMMAND}</div><div><br=
></div><div>The second fix uses shlex.quote (suitable for python 3.3 or abo=
ve) to quote the entire argument to &quot;sh -c&quot; including KCONFIG_CON=
FIG_COMMAND, avoiding also the need to manually escape any of the nested sh=
ell.</div><div><br></div><div>I think that the first fix is more portable, =
but they both require scrutiny to ensure fixing the problem properly is wor=
th the trouble.</div><div><br></div><div>For application in kirkstone and s=
ome others,=C2=A0meta/classes-recipe/cml1.bbclass needs changing to meta/cl=
asses/cml1.bbclass</div><div><br></div><div>I know that we have a good-enou=
gh-for-now fix from=C2=A0Jaeyoon Jung, so this isn&#39;t urgent, and maybe =
not even important.</div><div><br></div><div>Sam</div></div></div>

--000000000000af55f10621ee8ad7--

--000000000000af55f20621ee8ad9
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-avoid-the-need-to-escape-KCONFIG_CONFIG_COMMAND-for-.patch"
Content-Disposition: attachment; 
	filename="0001-avoid-the-need-to-escape-KCONFIG_CONFIG_COMMAND-for-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m0zhwufu0>
X-Attachment-Id: f_m0zhwufu0

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
TGlkZGljb3R0IDxzYW1AbGlkZGljb3R0LmNvbT4KLS0tCiBtZXRhL2NsYXNzZXMtcmVjaXBlL2Nt
bDEuYmJjbGFzcyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy1yZWNpcGUvY21sMS5iYmNsYXNzIGIv
bWV0YS9jbGFzc2VzLXJlY2lwZS9jbWwxLmJiY2xhc3MKaW5kZXggZDMxOWQ2NmFiMi4uMGRiYWYy
NWI4ZSAxMDA2NDQKLS0tIGEvbWV0YS9jbGFzc2VzLXJlY2lwZS9jbWwxLmJiY2xhc3MKKysrIGIv
bWV0YS9jbGFzc2VzLXJlY2lwZS9jbWwxLmJiY2xhc3MKQEAgLTQ4LDUgKzQ4LDUgQEAgcHl0aG9u
IGRvX21lbnVjb25maWcoKSB7CiAgICAgIyBlbnN1cmUgdGhhdCBlbnZpcm9ubWVudCB2YXJpYWJs
ZXMgYXJlIG92ZXJ3cml0dGVuIHdpdGggdGhpcyB0YXNrcyAnZCcgdmFsdWVzCiAgICAgZC5hcHBl
bmRWYXIoIk9FX1RFUk1JTkFMX0VYUE9SVFMiLCAiIFBLR19DT05GSUdfRElSIFBLR19DT05GSUdf
UEFUSCBQS0dfQ09ORklHX0xJQkRJUiBQS0dfQ09ORklHX1NZU1JPT1RfRElSIikKIAotICAgIG9l
X3Rlcm1pbmFsKCJzaCAtYyAnbWFrZSAlczsgaWYgWyBcXCQ/IC1uZSAwIF07IHRoZW4gZWNobyBc
IkNvbW1hbmQgZmFpbGVkLlwiOyBwcmludGYgXCJQcmVzcyBhbnkga2V5IHRvIGNvbnRpbnVlLi4u
IFwiOyByZWFkIHI7IGZpJyIgJSBkLmdldFZhcignS0NPTkZJR19DT05GSUdfQ09NTUFORCcpLAor
ICAgIG9lX3Rlcm1pbmFsKCJzaCAtYyAnbWFrZSBcIiRAXCIgOyBpZiBbICQ/IC1uZSAwIF07IHRo
ZW4gZWNobyBcIkNvbW1hbmQgZmFpbGVkLlwiOyBwcmludGYgXCJQcmVzcyBhbnkga2V5IHRvIGNv
bnRpbnVlLi4uIFwiOyByZWFkIHI7IGZpJyBvZV90ZXJtaW5hbC1jbWQgJXMgIiAlIGQuZ2V0VmFy
KCdLQ09ORklHX0NPTkZJR19DT01NQU5EJyksCiAgICAgICAgICAgICAgICAgZC5nZXRWYXIoJ1BO
JykgKyAnIENvbmZpZ3VyYXRpb24nLCBkKQotLSAKMi40My4wCg==
--000000000000af55f20621ee8ad9
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-use-shlex.quote-on-KCONFIG_CONFIG_COMMAND-for-do_men.patch"
Content-Disposition: attachment; 
	filename="0001-use-shlex.quote-on-KCONFIG_CONFIG_COMMAND-for-do_men.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m0zhxchb1>
X-Attachment-Id: f_m0zhxchb1

RnJvbSBhOTZmNDFmNmQ2ZjBkODMwOGQ3NGE3NGQ3MzZkNWEzNWRjNTRmMGZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTYW0gTGlkZGljb3R0IDxzYW1AbGlkZGljb3R0LmNvbT4KRGF0
ZTogVGh1LCAxMiBTZXAgMjAyNCAxNzoxODozNyArMDEwMApTdWJqZWN0OiB1c2Ugc2hsZXgucXVv
dGUgb24gS0NPTkZJR19DT05GSUdfQ09NTUFORCBmb3IgZG9fbWVudWNvbmZpZwoKQWx0aG91Z2gg
S0NPTkZJR19DT05GSUdfQ09NTUFORCBpcyBzaGVsbC1yZWFkeSwgaXQgbmVlZHMgZXNjYXBpbmcK
d2hlbiBjb21wb3NlZCBhcyBwYXJ0IG9mIHNvbWUgc2hlbGwgd2hpY2ggaXMgdGhlbiBlbWJlZGRl
ZCBpbnRvIGFuCm91dGVyICJzaCAtYyIgaW4gY21sMS5iYmNsYXNzCgpUaGlzIHBhdGNoIHVzZXMg
c2hsZXgucXVvdGUgdG8gZXNjYXBlIHRoZSBlbnRpcmUgc2hlbGwgZnJhZ21lbnQKd2hlbiBpdCBp
cyBjb21wb3NlZCBpbiB0aGUgaW5uZXIgInNoIC1jIgoKU2lnbmVkLW9mZi1ieTogU2FtIExpZGRp
Y290dCA8c2FtQGxpZGRpY290dC5jb20+Ci0tLQogbWV0YS9jbGFzc2VzLXJlY2lwZS9jbWwxLmJi
Y2xhc3MgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMtcmVjaXBlL2NtbDEuYmJjbGFzcyBiL21ldGEv
Y2xhc3Nlcy1yZWNpcGUvY21sMS5iYmNsYXNzCmluZGV4IGQzMTlkNjZhYjIuLmY2NzI3YzVjMzMg
MTAwNjQ0Ci0tLSBhL21ldGEvY2xhc3Nlcy1yZWNpcGUvY21sMS5iYmNsYXNzCisrKyBiL21ldGEv
Y2xhc3Nlcy1yZWNpcGUvY21sMS5iYmNsYXNzCkBAIC0zNiw0ICszNiw1IEBAIEtDT05GSUdfQ09O
RklHX0VOQUJMRV9NRU5VQ09ORklHID8/PSAidHJ1ZSIKIEtDT05GSUdfQ09ORklHX1JPT1RESVIg
Pz89ICIke0J9IgogcHl0aG9uIGRvX21lbnVjb25maWcoKSB7CiAgICAgaW1wb3J0IHNodXRpbAor
ICAgIGltcG9ydCBzaGxleAogCkBAIC00OCw1ICs0OSw1IEBAIHB5dGhvbiBkb19tZW51Y29uZmln
KCkgewogICAgICMgZW5zdXJlIHRoYXQgZW52aXJvbm1lbnQgdmFyaWFibGVzIGFyZSBvdmVyd3Jp
dHRlbiB3aXRoIHRoaXMgdGFza3MgJ2QnIHZhbHVlcwogICAgIGQuYXBwZW5kVmFyKCJPRV9URVJN
SU5BTF9FWFBPUlRTIiwgIiBQS0dfQ09ORklHX0RJUiBQS0dfQ09ORklHX1BBVEggUEtHX0NPTkZJ
R19MSUJESVIgUEtHX0NPTkZJR19TWVNST09UX0RJUiIpCiAKLSAgICBvZV90ZXJtaW5hbCgic2gg
LWMgJ21ha2UgJXM7IGlmIFsgXFwkPyAtbmUgMCBdOyB0aGVuIGVjaG8gXCJDb21tYW5kIGZhaWxl
ZC5cIjsgcHJpbnRmIFwiUHJlc3MgYW55IGtleSB0byBjb250aW51ZS4uLiBcIjsgcmVhZCByOyBm
aSciICUgZC5nZXRWYXIoJ0tDT05GSUdfQ09ORklHX0NPTU1BTkQnKSwKKyAgICBvZV90ZXJtaW5h
bCgnc2ggLWMgJXMnICUgc2hsZXgucXVvdGUoIm1ha2UgJXM7IGlmIFsgJD8gLW5lIDAgXTsgdGhl
biBlY2hvICdDb21tYW5kIGZhaWxlZC4nOyBwcmludGYgJ1ByZXNzIGFueSBrZXkgdG8gY29udGlu
dWUuLi4gJzsgcmVhZCByOyBmaSIgJSBkLmdldFZhcignS0NPTkZJR19DT05GSUdfQ09NTUFORCcp
KSwKICAgICAgICAgICAgICAgICBkLmdldFZhcignUE4nKSArICcgQ29uZmlndXJhdGlvbicsIGQp
Ci0tIAoyLjQzLjAK
--000000000000af55f20621ee8ad9--

