Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9EEA5600B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 14:29:10 +0000 (UTC)
Received: by qgev79 with SMTP id v79so121545926qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 07:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ydGYYOEx/bQYBY8CH2ARNq3Dml/yDdX+m+G4xf023jA=;
	b=QizkJLgkCzryi/uO7xsu3D+/Df7ADBsJ+lM2P6LLLp5VlQXQJHqgB+w4BjanTYVPQd
	va/k0XbpV2hGZLxbI7kuHjIHEmhbHnNZInwony66zXUj/fsJBPYhCL2vbnn9iBuYbirw
	YSdoZ4LfDcfw0WnUOekK+Y/XbxJxdlXFA+gW0NEo3T6F8eZa4iyml/qpqsomzzCmBAnY
	IC8Fjk2gjOUejKCuddvte9ErsKPkR0Vm/N7aNmMBOfbBH9YxGsBzy8x4+mqxu5zCuilv
	sjgA9K+wmCboX4d2407NrEF/Lp0tzdOE2MuYGTNWWg4RmAzmwX2kCIRooueoddOFByoX
	bgYA==
X-Gm-Message-State: ALoCoQklPP/cgS2aJFVsT8NttNn27RNwuVJjn+ukyXLSY1jvO9nXCmVaVTWGdNF/y7Kk1GdSgOuj
X-Received: by 10.140.165.196 with SMTP id l187mr24542534qhl.93.1443450550423; 
	Mon, 28 Sep 2015 07:29:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Mon, 28 Sep 2015 07:28:51 -0700 (PDT)
In-Reply-To: <1443440862-14585-1-git-send-email-george.l.musat@intel.com>
References: <1443440862-14585-1-git-send-email-george.l.musat@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 Sep 2015 15:28:51 +0100
Message-ID: <CAJTo0LZLMb_WEC3KdEYpNrUDmZYvb54tr4kKnkef32k9drECyA@mail.gmail.com>
To: Lucian Musat <george.l.musat@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/testimage: Add ability to run single test from suite.
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
X-List-Received-Date: Mon, 28 Sep 2015 14:29:10 -0000
Content-Type: multipart/alternative; boundary=001a1134f6744f33500520cf85fa

--001a1134f6744f33500520cf85fa
Content-Type: text/plain; charset=UTF-8

On 28 September 2015 at 12:47, Lucian Musat <george.l.musat@intel.com>
wrote:

> @@ -172,6 +176,7 @@ def exportTests(d,tc):
> +    from re import search as re_search
>

Just import re and then do re.search - it's the same number of characters
when calling and it's obvious what you're calling then.

     for t in tc.testslist:
> +        if re_search("\w+\.\w+\.test_\S+", t):
> +            t = t.split('.')[0]+'.'+t.split('.')[1]+'.'+t.split('.')[2]


Not sure I understand what this is meant to be doing.  If t matches
[alphanumerics].[alphanumerics].test_[not whitespace] repeatedly split t on
dots and re-join it back together with dots.  For the example of
filename.class.test_method doesn't this reconstruct the input?  If you're
attempting to truncate to the first three elements, then something like
'.'.join(t.split('.')[:3]) is much more efficient and Pythonic.

Ross

--001a1134f6744f33500520cf85fa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 28 September 2015 at 12:47, Lucian Musat <span dir=3D"l=
tr">&lt;<a href=3D"mailto:george.l.musat@intel.com" target=3D"_blank">georg=
e.l.musat@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex">@@ -172,6 +176,7 @@ def exportTest=
s(d,tc):<br>+=C2=A0 =C2=A0 from re import search as re_search<br></blockquo=
te><div><br></div><div class=3D"gmail_extra">Just import re and then do re.=
search - it&#39;s the same number of characters when calling and it&#39;s o=
bvious what you&#39;re calling then.</div><div class=3D"gmail_extra"><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:sol=
id;padding-left:1ex">=C2=A0 =C2=A0 =C2=A0for t in tc.testslist:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if re_search(&quot;\w+\.\w+\.test_\S+&quot;, t=
):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D t.split(&#39;.&#39;)[0]+&#=
39;.&#39;+t.split(&#39;.&#39;)[1]+&#39;.&#39;+t.split(&#39;.&#39;)[2]</bloc=
kquote><div><br></div><div>Not sure I understand what this is meant to be d=
oing.=C2=A0 If t matches [alphanumerics].[alphanumerics].test_[not whitespa=
ce] repeatedly split t on dots and re-join it back together with dots.=C2=
=A0 For the example of filename.class.test_method doesn&#39;t this reconstr=
uct the input?=C2=A0 If you&#39;re attempting to truncate to the first thre=
e elements, then something like &#39;.&#39;.join(t.split(&#39;.&#39;)[:3]) =
is much more efficient and Pythonic.</div><div><br></div><div>Ross</div></d=
iv></div></div>

--001a1134f6744f33500520cf85fa--
