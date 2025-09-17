Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF1CCAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 13:44:03 +0000 (UTC)
Subject: Re: [PATCH] python3-cython: make generated source file be reproducible
To: openembedded-core@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (128.224.246.2)
X-Originating-Platform: Linux Chrome 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 06:43:55 -0700
References: <4149a1b0-f423-4942-ba48-6b9f70e8ec61@gmail.com>
In-Reply-To: <4149a1b0-f423-4942-ba48-6b9f70e8ec61@gmail.com>
Message-ID: <1435.1758116635407448720@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="5yEVW1BI0UdpIwfVGtqR"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 13:44:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223603

--5yEVW1BI0UdpIwfVGtqR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 05:26 AM, Gyorgy Sarvari wrote:

>=20
>=20
>> +diff --git a/Cython/Compiler/ModuleNode.py
>> b/Cython/Compiler/ModuleNode.py
>> +index 6672cb986..ae1625ea2 100644
>> +--- a/Cython/Compiler/ModuleNode.py
>> ++++ b/Cython/Compiler/ModuleNode.py
>> +@@ -779,7 +779,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
>> + code.put_generated_by()
>> + if metadata:
>> + code.putln("/* BEGIN: Cython Metadata")
>> +- code.putln(json.dumps(metadata, indent=3D4, sort_keys=3DTrue))
>> ++ _metadata =3D json.dumps(metadata, indent=3D4, sort_keys=3DTrue)
>> ++ _metadata =3D _metadata.replace(os.getcwd()+'/', '')
>=20
> I don't think that this is going to work on Windows due to the different
> default path separator (of course for Yocto that doesn't matter much,
> but I think upstream cares about it)

OK, I will use hardcode string 'build_path' to replace actual build path pr=
efix,
it should be portable for both of Linux and Windows.

Please drop this review, v2 incomig

//Hongxu

>=20
> Maybe os.path.sep would be more portable?

--5yEVW1BI0UdpIwfVGtqR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Sep 17, 2025 at 05:26 AM, Gyorgy Sarvari wrote:</div>
<div>
<blockquote>
<blockquote>+diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/M=
oduleNode.py<br />+index 6672cb986..ae1625ea2 100644<br />+--- a/Cython/Com=
piler/ModuleNode.py<br />++++ b/Cython/Compiler/ModuleNode.py<br />+@@ -779=
,7 +779,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):<br />+ code.put=
_generated_by()<br />+ if metadata:<br />+ code.putln("/* BEGIN: Cython Met=
adata")<br />+- code.putln(json.dumps(metadata, indent=3D4, sort_keys=3DTru=
e))<br />++ _metadata =3D json.dumps(metadata, indent=3D4, sort_keys=3DTrue=
)<br />++ _metadata =3D _metadata.replace(os.getcwd()+'/', '')</blockquote>
I don't think that this is going to work on Windows due to the different<br=
 />default path separator (of course for Yocto that doesn't matter much,<br=
 />but I think upstream cares about it)</blockquote>
OK, I will use hardcode string 'build_path' to replace actual build path pr=
efix,</div>
<div>it should be portable for both of Linux and Windows.</div>
<div>&nbsp;</div>
<div>Please drop this review, v2 incomig</div>
<div>&nbsp;</div>
<div>//Hongxu<br />
<blockquote>Maybe os.path.sep would be more portable?</blockquote>
</div>

--5yEVW1BI0UdpIwfVGtqR--

