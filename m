Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADF2C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 23:04:19 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.2156.1739401452805541708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 15:04:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ug1VVVk9;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4394820123dso1438335e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 15:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739401451; x=1740006251; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dM7gL22qlPt2Ro9d2dMJfC9EsiB4jdQR7wXECE53zWQ=;
        b=Ug1VVVk9+P9jHnanPcyUPXw06Fes0bCTm2NDvgU6ysVE18vrlT91tB4VuE7BO5eoOk
         yjev6vI0iFdDDrEMyVLVB7FLLZL8dLtfAd6wO8ZtNdbliQmfrGi7HwKZCNU3zmDu4m5e
         NWHH7R+0pu6AsueK86kur+x6e443FuKiZdNNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739401451; x=1740006251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dM7gL22qlPt2Ro9d2dMJfC9EsiB4jdQR7wXECE53zWQ=;
        b=ueLIT1WQuRI16WDxNYKqYA8IPtGX/HbvB53jgv0wZRkGWxZMhr51Bj/TavmyF5aAbF
         rOjWvffMECRm7zFOd8kZB2gDLMnA38CX/JAh0wS+QmHuQ+FRanCuLhryUsM/TsDooli/
         jY09zTS4DcFbzNjnl8CkFQY6qmq8fgVMNHJWXfCyJbz3xxqL6/BQY6MIuxojGopehfLI
         PCoSXnIDs4h9jvp7e9Jkz9QXbSgjKS6chCXPaVcWbOezr//JHZ2VMoWGNLok8A0oW+pg
         lY4Mdoa3htf/ZYtHzM7Ofn0/3+yE8k6ma3tugSObyofD1iaNQp23hJ5rtxBmFHnMScuD
         EaJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX560I1siZcWf00KckoAxnZ3sWjuXoAdRtW0gJws2YHhk+P7llzEuW33liVwI6y8bfEpp5GDOMS87Jtd13wCkY9fg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyf1FzneNz1qYVAX01DnwBIngYQ0/C651yno2Lezj3vvgGl7yHD
	Y2fyCjemVF1dFwmR2LvNV4yig1w5kaH4vBlkQpWoUjW+RbnAlVT0z6uA2BaHDQ6TtJi4h6IhKqR
	QFgfFMAad+WOwig4VGlCfLqTfJWzjVdmMPASHAQ==
X-Gm-Gg: ASbGncthrVhkC6Lxz8xnBgML2dxb8FPzaYscmSL8gpP64azhe6BChif4ydhB585v0F+
	048BvWWDD963ei4egRC3np/LIKRLNhRq6fBm/eOgonMVUtSnXV6iHjZUNlkwYa70TF4rC/E4hha
	YteVbAJEY7ycFc5anFjqYe4Dcd9TITkQ==
X-Google-Smtp-Source: AGHT+IH5YzSJ5xeVL1iPMi3WIUhvLcO99sMZYTaPgd/pyc1EBO68D4ta/pxn0JvEP4cNNzmhfRB3IdAxFhqdVlodjig=
X-Received: by 2002:a5d:47aa:0:b0:38d:a90c:d489 with SMTP id
 ffacd0b85a97d-38f24527c75mr936953f8f.45.1739401451103; Wed, 12 Feb 2025
 15:04:11 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9Fr9MFy5uub2_pTRWmVbt96OWBJ5ty+eAB9Qn+LYa_Wg@mail.gmail.com>
 <CANNYZj-PbWQDa5hAc5X6sqHVMvJ0QE01XXwytya8rprwvSsqag@mail.gmail.com>
 <d22a4cec5e317e62f1f44d8d9a810cf4745ccb48.camel@linuxfoundation.org>
 <CAMSfU+6d7gvYkjC5sbUPu6D_hOOF43ZUnM_NMEwmLUxZn6ysSA@mail.gmail.com>
 <4e883a56eb9b74a5663d7ad258194d16b1c79912.camel@linuxfoundation.org> <CAMSfU+44qwScnoDP4As37TNHYvwx5mBmTdGEQgq_VVz7woh6sQ@mail.gmail.com>
In-Reply-To: <CAMSfU+44qwScnoDP4As37TNHYvwx5mBmTdGEQgq_VVz7woh6sQ@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 13 Feb 2025 00:03:44 +0100
X-Gm-Features: AWEUYZkGBaT4IGi7Trahzu4G5oQb-aATnaxMUev5XjHNP56kyCrgsCSZGxPR4Ug
Message-ID: <CAMSfU+4MY-JVmWPUixJYiUrtKd2CXHrJuQ0sMJJrrkLzrvAuvA@mail.gmail.com>
Subject: Re: [yocto] [OE-core] Yocto Project Status 11 Feb. 2025 (WW07)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yocto Mailing list <yocto@lists.yoctoproject.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009d85cf062df9f5c5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 23:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211282

--0000000000009d85cf062df9f5c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 12 f=C3=A9vr. 2025 =C3=A0 12:19, Yoann Congal <yoann.congal@smile.f=
r> a
=C3=A9crit :

> Le mer. 12 f=C3=A9vr. 2025 =C3=A0 10:51, Richard Purdie <
> richard.purdie@linuxfoundation.org> a =C3=A9crit :
>
>> On Wed, 2025-02-12 at 09:08 +0100, Yoann Congal wrote:
>> > Le mer. 12 f=C3=A9vr. 2025 =C3=A0 00:36, Richard Purdie via
>> lists.yoctoproject.org <richard.purdie=3D
>> linuxfoundation.org@lists.yoctoproject.org> a =C3=A9crit :
>> > > The repositories were added to try and share bandwidth costs, give
>> > > people easier mirrors and various other justifications. I warned
>> > > strongly about the pull request problems at the time, I was told it
>> > > would get handled and people would help and I was over reacting. Som=
e
>> > > of the people who made those offers aren't active with the project a=
ny
>> > > more, other things just drifted with time. At one point I ended up
>> > > having to add those mirrors to my own push scripts and maintain them
>> > > because nobody else was willing and we had complaints they were not =
up
>> > > to date.
>> > >
>> > > You used to be able to disable pull requests for six month periods, =
it
>> > > looks like you can no longer do that and it was a pain having to try
>> > > and remember anyway.
>> > >
>> > > The bandwidth/mirror/backup benefits are valid and I'd be reluctant =
to
>> > > delete them as some people can only discover things through github
>> too.
>> > > Google indexing doesn't work well with our own server.
>> > >
>> > > So I guess I made my own peace with their existence. I know touching
>> > > them will make it look more like a condoned submission method but I
>> > > really don't see many good options here. Removing them is a simple
>> easy
>> > > option but life sometimes isn't easy/simple.
>> >
>> > We can try things to push users out of github :
>> > * Leaving a fake PR at the top of the list with a title along the
>> > line of "Please don't open a PR but instead go to <contributing guide
>> > link>"
>> > * using the PR template (the text pre-filled for the new PR
>> > description) to convey the same info
>> > * A bot that automatically answer the PRs with a comment with the
>> > same idea (the bot could also close the PR but that might be a bit
>> > harsh)
>>
>> If anyone has experience of setting this up I'd welcome help. The
>> things I did learn briefly looking yesterday are that:
>>
>
I've played around a bit

* the template requires putting .git* files in the repo which is a bit
>> annoying
>>
> * there is a way to do it in a separate repo but that would apply to
>> all repos, not just oe-core and bitbake, at least from what I read
>>
>
I can confirm : You create a .github repo in your github organisation and
the templates inside will be used for every repos of the organisation.

For example: What you see when you try to create a PR :
https://github.com/yoconyptestgh/poky/pull/new/prononciation

What you can do with this: Have a default template "This project prefers
contribution via email, see contributing guide" for the whole org but repo
that want to follow github workflows (PR, issues) can override this in
their repo in a ".github/" folder. Not entirely satisfactory but better,
maybe?
NB: the vscode-bitbake repo already has it:
https://github.com/yoctoproject/vscode-bitbake/tree/staging/.github

Using "github actions" (the CI that could run on PR creation) seems
impossible without polluting our repos with a ".github/" repository.
If we accept to have a ".github/" directory, creating an action that
comments on every new PR is nearly trivial.

A single open pull request might also help github contributor understand
what the project want them to do:
https://github.com/yoconyptestgh/poky/pulls


> * our type of account may or may not have some of the features needed
>> for bots and so on
>>
>
Right now, the most clean approach I can think of is (given our
constraints):
* Selected repos in the yoctoproject github org use webhooks (available in
Free tier) to notify the creation of a PR or an issue
* We host (and maintain (!)) a service somewhere (on AB infra?) to receive
these notifications
* This service uses the github API to post a nice comment on the created
PR/issue (and can even close it).

I did not find a magic silver bullet that would solve everything (I
discovered that Gitlab is way more flexible on this subject).
I guess we need to find a compromise between what a github user sees and
the effort we are willing to put into it.

Regards,

So I'm not against any of these but it could do with someone with some
>> experience. I can probably learn what is needed but I have time
>> challenges like everyone else..
>>
>> There will probably be a need to maintain any bot going forward too.
>>
>
> I volunteer to setup a PoC in my repos to see what is possible given thos=
e
> constraints.
>
> I'm more experienced in Gitlab than GitHub but I should be able to
> translate.
>
> Obviously, if anyone has direct experience on that, don't hesitate to
> speak up.
>
> What kind of account does the yocto project has on GitHub?
>
> Cheers,
>>
>> Richard
>>
>>
>>
>>

--=20
Yoann Congal
Smile ECS - Tech expert

--0000000000009d85cf062df9f5c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0mer. 12 f=C3=A9vr. 2025 =C3=A0=C2=
=A012:19, Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.c=
ongal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:</div><div class=3D"gmail_quote g=
mail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">Le mer. 12 f=C3=A9vr. 2025 =C3=A0 10:51, Richard Purdie &lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Wed, 2025-02-12 at 09:08 +0100, Y=
oann Congal wrote:<br>
&gt; Le=C2=A0mer. 12 f=C3=A9vr. 2025 =C3=A0=C2=A000:36, Richard Purdie via =
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">lists.yoctoproject.org</a> &lt;richard.purdie=3D<a href=3D"m=
ailto:linuxfoundation.org@lists.yoctoproject.org" rel=3D"noreferrer" target=
=3D"_blank">linuxfoundation.org@lists.yoctoproject.org</a>&gt; a =C3=A9crit=
=C2=A0:<br>
&gt; &gt; The repositories were added to try and share bandwidth costs, giv=
e<br>
&gt; &gt; people easier mirrors and various other justifications. I warned<=
br>
&gt; &gt; strongly about the pull request problems at the time, I was told =
it<br>
&gt; &gt; would get handled and people would help and I was over reacting. =
Some<br>
&gt; &gt; of the people who made those offers aren&#39;t active with the pr=
oject any<br>
&gt; &gt; more, other things just drifted with time. At one point I ended u=
p<br>
&gt; &gt; having to add those mirrors to my own push scripts and maintain t=
hem<br>
&gt; &gt; because nobody else was willing and we had complaints they were n=
ot up<br>
&gt; &gt; to date.<br>
&gt; &gt; <br>
&gt; &gt; You used to be able to disable pull requests for six month period=
s, it<br>
&gt; &gt; looks like you can no longer do that and it was a pain having to =
try<br>
&gt; &gt; and remember anyway.<br>
&gt; &gt; <br>
&gt; &gt; The bandwidth/mirror/backup benefits are valid and I&#39;d be rel=
uctant to<br>
&gt; &gt; delete them as some people can only discover things through githu=
b too.<br>
&gt; &gt; Google indexing doesn&#39;t work well with our own server.<br>
&gt; &gt; <br>
&gt; &gt; So I guess I made my own peace with their existence. I know touch=
ing<br>
&gt; &gt; them will make it look more like a condoned submission method but=
 I<br>
&gt; &gt; really don&#39;t see many good options here. Removing them is a s=
imple easy<br>
&gt; &gt; option but life sometimes isn&#39;t easy/simple.<br>
&gt; <br>
&gt; We can try things to push users out of github :<br>
&gt; * Leaving a fake PR at the top of the list with a title along the<br>
&gt; line of &quot;Please don&#39;t open a PR but instead go to &lt;contrib=
uting guide<br>
&gt; link&gt;&quot;<br>
&gt; * using the PR template (the text pre-filled for the new PR<br>
&gt; description) to convey the same info<br>
&gt; * A bot that automatically answer the PRs with a comment with the<br>
&gt; same idea (the bot could also close the PR but that might be a bit<br>
&gt; harsh)<br>
<br>
If anyone has experience of setting this up I&#39;d welcome help. The<br>
things I did learn briefly looking yesterday are that:<br></blockquote></di=
v></div></div></blockquote><div><br></div><div>I&#39;ve played around a bit=
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"auto"><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
* the template requires putting .git* files in the repo which is a bit<br>
annoying <br></blockquote></div></div></div></blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"auto"><div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
* there is a way to do it in a separate repo but that would apply to<br>
all repos, not just oe-core and bitbake, at least from what I read<br></blo=
ckquote></div></div></div></blockquote><div><br></div><div>I can confirm : =
You create a .github repo in your github organisation and the templates ins=
ide will be used for every repos of the organisation.</div><div><br></div><=
div>For example: What you see when you try to create a PR : <a href=3D"http=
s://github.com/yoconyptestgh/poky/pull/new/prononciation">https://github.co=
m/yoconyptestgh/poky/pull/new/prononciation</a></div><div><br></div><div>Wh=
at you can do with this: Have a default template &quot;This project prefers=
 contribution via email, see contributing guide&quot; for the whole org but=
 repo that want to follow github workflows (PR, issues) can override this i=
n their repo in a &quot;.github/&quot; folder. Not entirely satisfactory bu=
t better, maybe?</div><div>NB: the vscode-bitbake repo already has it: <a h=
ref=3D"https://github.com/yoctoproject/vscode-bitbake/tree/staging/.github"=
>https://github.com/yoctoproject/vscode-bitbake/tree/staging/.github</a></d=
iv><div><br></div><div>Using &quot;github actions&quot; (the CI that could =
run on PR creation) seems impossible without polluting our repos with a &qu=
ot;.github/&quot; repository.</div><div>If we accept to have a &quot;.githu=
b/&quot; directory, creating an action that comments on every new PR is nea=
rly trivial.</div><div><br></div><div>A single open pull request might also=
 help github contributor understand what the project want them to do:</div>=
<div><a href=3D"https://github.com/yoconyptestgh/poky/pulls">https://github=
.com/yoconyptestgh/poky/pulls</a></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"auto"><div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
* our type of account may or may not have some of the features needed<br>
for bots and so on<br></blockquote></div></div></div></blockquote><div><br>=
</div><div>Right now, the most clean approach I can think of is (given our =
constraints):</div><div>* Selected repos in the yoctoproject github org use=
 webhooks (available in Free tier) to notify the creation of a PR or an iss=
ue</div><div>* We host (and maintain (!)) a service somewhere (on AB infra?=
) to receive these notifications</div><div>* This service uses the github A=
PI to post a nice comment on the created PR/issue (and can even close it).<=
/div><div><br></div><div>I did not find a magic silver bullet that would so=
lve everything (I discovered that Gitlab is way more flexible on this subje=
ct).</div><div>I guess we need to find a compromise between what a github u=
ser sees and the effort we are willing to put into it.</div><div><br></div>=
<div>Regards,</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"auto"><div><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
So I&#39;m not against any of these but it could do with someone with some<=
br>
experience. I can probably learn what is needed but I have time<br>
challenges like everyone else..<br><br></blockquote></div></div></div></blo=
ckquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"=
><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">

There will probably be a need to maintain any bot going forward too.<br></b=
lockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I volun=
teer to setup a PoC in my repos to see what is possible given those constra=
ints.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m more exper=
ienced in Gitlab than GitHub but I should be able to translate.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Obviously, if anyone has direct exp=
erience on that, don&#39;t hesitate to speak up.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">What kind of account does the yocto project has on=
 GitHub?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div></div></div>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>

--0000000000009d85cf062df9f5c5--

