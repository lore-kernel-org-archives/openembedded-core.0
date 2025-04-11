Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC37EC36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 09:35:59 +0000 (UTC)
Subject: Re: [PATCH 2/2] buildtools-tarball: add envvars into BB_ENV_PASSTHROUGH_ADDITIONS
To: openembedded-core@lists.openembedded.org
From: "Changqing Li" <changqing.li@windriver.com>
X-Originating-Location: US (147.11.252.42)
X-Originating-Platform: Linux Firefox 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 11 Apr 2025 02:35:56 -0700
References: <20250408093822.479573-2-changqing.li@windriver.com>
In-Reply-To: <20250408093822.479573-2-changqing.li@windriver.com>
Message-ID: <2395.1744364156005400114@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="aizVO270oETU73UmhkHH"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 09:35:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214722

--aizVO270oETU73UmhkHH
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Following error is reported without this commit: =C2=A0"7ed9f4b7aa curl: on=
ly set CA bundle in target build"
Cloning into 'protobuf'...
fatal: unable to access 'https://github.com/protocolbuffers/protobuf/': err=
or setting certificate file: /usr/local/oe-sdk-hardcoded-buildpath/sysroots=
/x86_64-wrlinuxsdk-linux/etc/ssl/certs/ca-certificates.crt

With commit "7ed9f4b7aa curl: only set CA bundle in target build", git clon=
e still failed, =C2=A0but with another error:
fatal: unable to access 'https://github.com/protocolbuffers/protobuf/': SSL=
 certificate problem: unable to get local issuer certificate

For native-curl, if we don't set --with-ca-bundle, =C2=A0since it is not cr=
oss-compile, it will detect the default CA cert bundle/path, that is host c=
ert.
but for nativesdk-curl, it is detect as cross-compile(build=3Dx86_64-linux,=
 host=3Dx86_64-pokysdk-linux), so no default CA cert bundle is detect. So r=
eport error =C2=A0"unable to get local issuer certificate".

I think we still need to add GIT_SSL_CAINFO/CURL_CA_BUNDLE/REQUESTS_CA_BUND=
LE into BB_ENV_PASSTHROUGH_ADDITIONS.
But another patch is needed to try to make curl use host cert by default.

Regards
Changqing

--aizVO270oETU73UmhkHH
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,<br />&nbsp;<br />Following error is reported without this commit: =
&nbsp;"7ed9f4b7aa curl: only set CA bundle in target build"<br />Cloning in=
to 'protobuf'...<br />fatal: unable to access 'https://github.com/protocolb=
uffers/protobuf/': error setting certificate file: /usr/local/oe-sdk-hardco=
ded-buildpath/sysroots/x86_64-wrlinuxsdk-linux/etc/ssl/certs/ca-certificate=
s.crt<br />&nbsp;<br />With commit "7ed9f4b7aa curl: only set CA bundle in =
target build", git clone still failed, &nbsp;but with another error:<br />f=
atal: unable to access 'https://github.com/protocolbuffers/protobuf/': SSL =
certificate problem: unable to get local issuer certificate<br />&nbsp;<br =
/>For native-curl, if we don't set --with-ca-bundle, &nbsp;since it is not =
cross-compile, it will detect the default CA cert bundle/path, that is host=
 cert.<br />but for nativesdk-curl, it is detect as cross-compile(build=3Dx=
86_64-linux, host=3Dx86_64-pokysdk-linux), so no default CA cert bundle is =
detect. So report error &nbsp;"unable to get local issuer certificate".<br =
/>&nbsp;<br />I think we still need to add GIT_SSL_CAINFO/CURL_CA_BUNDLE/RE=
QUESTS_CA_BUNDLE into BB_ENV_PASSTHROUGH_ADDITIONS.<br />But another patch =
is needed to try to make curl use host cert by default.</div>
<div>&nbsp;</div>
<div>Regards</div>
<div>Changqing</div>

--aizVO270oETU73UmhkHH--

