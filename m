Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 616EC7702D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 00:57:20 +0000 (UTC)
Received: by wibz8 with SMTP id z8so82441173wib.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 17:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hhXcldqRbGGeywK+qowth/qXv6aFfTIub4vJhqFk7Hs=;
	b=zkeDul4tT0iu8EzLwJczyNyW06AU06iI9SNV0VgFgDkcB7SHXNDYcpW7jLBgqvVY7R
	F5Wag8hY6/SvzdL2UX1zqKKnUazTGPWCA9hCSl+GSjKCqE+/FJ0MQsXog10/b/h+XKh2
	vQEN/dXw8r8XbQGzeOHixFOp3+NMBZQGsDYi40TUReHaZSrk9Hnz8SkuL3ZLG1EYqzWI
	9oUrlKC4/iZ229oSGWvqcaduq3qAms+ti2+stLT+IVM3+4AAuJuzQCBNfcpWoDz1KADL
	sO9ol7nd7+JhAZs4cSKLYbV1QoDTvxZXc4AxHmlBaqQmNPamG2Q1u+xGoKaJQLksltgf
	Or3g==
MIME-Version: 1.0
X-Received: by 10.180.84.163 with SMTP id a3mr5383375wiz.34.1441241840133;
	Wed, 02 Sep 2015 17:57:20 -0700 (PDT)
Received: by 10.28.64.196 with HTTP; Wed, 2 Sep 2015 17:57:20 -0700 (PDT)
In-Reply-To: <55E769B4.4050800@linux.intel.com>
References: <1441211805-17543-1-git-send-email-alejandro.franco@linux.intel.com>
	<1441216283.24871.78.camel@linuxfoundation.org>
	<20150902182548.GG2470@jama> <55E769B4.4050800@linux.intel.com>
Date: Thu, 3 Sep 2015 02:57:20 +0200
Message-ID: <CA+chaQddNikh4vveg30U8WVYG5XcpewM9OHrgahzr_qTHSF+pw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Alex Franco <alejandro.franco@linux.intel.com>
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Fix recursive mode -st on BUILDDIR setup
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
X-List-Received-Date: Thu, 03 Sep 2015 00:57:21 -0000
Content-Type: multipart/alternative; boundary=f46d043c06e0eaaa64051ecd4353

--f46d043c06e0eaaa64051ecd4353
Content-Type: text/plain; charset=UTF-8

Warning informing that chmod failed is better than fatal error preventing
me to build anything in that setup with tmpfs.

On Wed, Sep 2, 2015 at 11:27 PM, Alex Franco <
alejandro.franco@linux.intel.com> wrote:

> Checking may be the better approach, as warning here would do little more
> than what the current failure does (informing that chmod failed)
>
> Alex Franco
>
>
> On 09/02/2015 01:25 PM, Martin Jansa wrote:
>
>> On Wed, Sep 02, 2015 at 06:51:23PM +0100, Richard Purdie wrote:
>>
>>> On Wed, 2015-09-02 at 11:36 -0500, Alex Franco wrote:
>>>
>>>> Removing recursive option from chmod -st on BUILDDIR as it would
>>>> take very long on existing build directories
>>>>
>>>> [YOCTO 7669]
>>>>
>>>> Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
>>>> ---
>>>>   scripts/oe-setup-builddir | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
>>>> index f5b7e4e..44c7dcc 100755
>>>> --- a/scripts/oe-setup-builddir
>>>> +++ b/scripts/oe-setup-builddir
>>>> @@ -24,7 +24,7 @@ if [ -z "$BUILDDIR" ]; then
>>>>   fi
>>>>     mkdir -p "$BUILDDIR/conf"
>>>> -chmod -R -st "$BUILDDIR"
>>>> +chmod -st "$BUILDDIR"
>>>>
>>> I think you did this so that conf/ gets the right permissions too.
>>> Perhaps the best approach is:
>>>
>>> +chmod -st "$BUILDDIR" $BUILDDIR/conf"
>>>
>> Can we add "|| bbwarn foo"
>>
>> for cases when it doesn't work for whatever reason or check the
>> permissions of these 2 dirs before calling chmod?
>>
>> ?
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>

--f46d043c06e0eaaa64051ecd4353
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Warning informing that chmod failed is better than fatal e=
rror preventing me to build anything in that setup with tmpfs.<div><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Sep 2, 2015 at 11=
:27 PM, Alex Franco <span dir=3D"ltr">&lt;<a href=3D"mailto:alejandro.franc=
o@linux.intel.com" target=3D"_blank">alejandro.franco@linux.intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">Checking may be the bett=
er approach, as warning here would do little more than what the current fai=
lure does (informing that chmod failed)<span class=3D"HOEnZb"><font color=
=3D"#888888"><br>
<br>
Alex Franco</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 09/02/2015 01:25 PM, Martin Jansa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Wed, Sep 02, 2015 at 06:51:23PM +0100, Richard Purdie wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Wed, 2015-09-02 at 11:36 -0500, Alex Franco wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Removing recursive option from chmod -st on BUILDDIR as it would<br>
take very long on existing build directories<br>
<br>
[YOCTO 7669]<br>
<br>
Signed-off-by: Alex Franco &lt;<a href=3D"mailto:alejandro.franco@linux.int=
el.com" target=3D"_blank">alejandro.franco@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0 scripts/oe-setup-builddir | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir<br>
index f5b7e4e..44c7dcc 100755<br>
--- a/scripts/oe-setup-builddir<br>
+++ b/scripts/oe-setup-builddir<br>
@@ -24,7 +24,7 @@ if [ -z &quot;$BUILDDIR&quot; ]; then<br>
=C2=A0 fi<br>
=C2=A0 =C2=A0 mkdir -p &quot;$BUILDDIR/conf&quot;<br>
-chmod -R -st &quot;$BUILDDIR&quot;<br>
+chmod -st &quot;$BUILDDIR&quot;<br>
</blockquote>
I think you did this so that conf/ gets the right permissions too.<br>
Perhaps the best approach is:<br>
<br>
+chmod -st &quot;$BUILDDIR&quot; $BUILDDIR/conf&quot;<br>
</blockquote>
Can we add &quot;|| bbwarn foo&quot;<br>
<br>
for cases when it doesn&#39;t work for whatever reason or check the<br>
permissions of these 2 dirs before calling chmod?<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></blockquote>
<br>
</div></div></blockquote></div><br></div></div></div>

--f46d043c06e0eaaa64051ecd4353--
