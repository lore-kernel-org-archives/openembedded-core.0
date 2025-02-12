Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11F4C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 17:45:18 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.22445.1739382312150301592
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 09:45:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lrhPy8/C;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2fbfe16cc39so49424a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 09:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739382311; x=1739987111; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RHGsBrvUJnwDBqu+fHqVps5+RWtucvwC65JNkPDhuJs=;
        b=lrhPy8/CrQNw2YL6ZSn/EwqXuxwJH4XjmjRuwych3JodH247FjtF280mQl5j+0yyUf
         v8a3VQJoLgdY1hCLtCB3CMvyLtE5hgqrg8eOhTLeKVoFrKftD6TCnpPlA/rfV1Vq8EUA
         aESE8wGWybarZP/yXXXAG3MpHKCRtv5+Bv0yKU42yCkftoUQjwBpG6mWurdsK/BEiqOi
         MMwQfSAQg7tfSXK893NgBCrkNrHPZWtu7vmN+SI5gtZ9tzUxdgWbq1wOe08MyircL1dW
         0ejn+Ec8tVdO4mQIW3QE5RoomIeOxWTFBwwWBPGGYrgFk9h41kO8R1rO/FxAqUv1+qZD
         l10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739382311; x=1739987111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHGsBrvUJnwDBqu+fHqVps5+RWtucvwC65JNkPDhuJs=;
        b=WDPq2G48ko1oeWyo283WeOFXBVIn0mpRdKrxScKJfQMmfTrRnTo3gjolEOqnDEvrjQ
         jGmY6EDRZVEOJziXK5TK+PJbCh03X6xhxK7E1cUx4D/TZFukmxX2hRR+KKI8oNUT3m2j
         OKuW92RqfFpeLljRpqqJZTdpJtv6BwLRbsJdxZTHTtYPniTTgQKHoIv+VbIa8HU5iUIf
         3DB14GufmoOnWzqUycO4TnZrKpfLeBvhIIYY12IjROL0A5SnTp/ce2SdwmubKcM/KixK
         K47MKMPaDteBcnvivYXrh+pkq7Kvhx30+CKskxe8bQ4wFhozGe9Nbv331zH2uH3/eFiB
         EgsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqmakM5N7vaKVF2dT/r5WdxYbDyBrE6G1cpBCDVh0k4gAshDgvgpothPB9S6ZjpU+y4S1pdgXI6M/t/apAIt7A3Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz7d/c9CM/PMPNAebOG2CyZa6bc7j7ndmGS0LxsQ+RuiA9MYJYj
	H/ZxVa3rcSDN7VZPUGtdQf9j1aZ8b+C1/abTg0lHqcXf+NMGNL3HPnLWkJtZ0w2QyxgJGo4/Woq
	8opnHmN5SwVz3Z/JNghllqraJ0BA=
X-Gm-Gg: ASbGncsruZL7IGTaZAeaprGLiw0qPvMWT5fTzkD7M6lqjpLRQ8QsfziLn4lovqh9z8U
	BpTCiTnOeFJyjn2n2yY2PeO3Lxps6lYiYopQyx0t2Fj14aG5iif6HxbTLql9MP6OqdewDk718
X-Google-Smtp-Source: AGHT+IHLYPkEJyn7jStv6Z1NC60od6y1EbKuEUMwRnJxBPmXalPjS0JcRvpYo9oClVJZIbX5yrrYvIK70muWZ/GkHy0=
X-Received: by 2002:a17:90b:2c8e:b0:2ea:712d:9a82 with SMTP id
 98e67ed59e1d1-2fbf5c71357mr6006829a91.29.1739382311415; Wed, 12 Feb 2025
 09:45:11 -0800 (PST)
MIME-Version: 1.0
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-21-stefan.herbrechtsmeier-oss@weidmueller.com>
 <d933e37f2be3e98c72f99191b504efe607d50c96.camel@linuxfoundation.org>
 <f2a970ab-14da-4108-a050-04851a7bd480@weidmueller.com> <CADkTA4MZozK1oBwM6-=FShj2N-kke4w9=FDkTrd668XkvjsTbw@mail.gmail.com>
 <7848a428-7193-4597-9b85-84e7dd4d3b32@weidmueller.com>
In-Reply-To: <7848a428-7193-4597-9b85-84e7dd4d3b32@weidmueller.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 12 Feb 2025 12:45:02 -0500
X-Gm-Features: AWEUYZm8Wxv1odgrq2OS_Sic4k4roh8NRxXwUOJUanVgHu_WnWk132qqc3OCwNw
Message-ID: <CADkTA4MtM9ZbakC-u0Qk8bQjcOk6uYuYYhFagWR3fmNqC7gWrw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 21/30] python3-bcrypt: mirgrate to vendor
 cargo class
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="000000000000ccf5f3062df5807f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 17:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211266

--000000000000ccf5f3062df5807f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 12:24=E2=80=AFPM Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

> Am 12.02.2025 um 16:07 schrieb Bruce Ashfield:
>
> On Wed, Feb 12, 2025 at 9:36=E2=80=AFAM Stefan Herbrechtsmeier via
> lists.openembedded.org <stefan.herbrechtsmeier-oss=3D
> weidmueller.com@lists.openembedded.org> wrote:
>
>> Am 11.02.2025 um 22:46 schrieb Richard Purdie:
>>
>> On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier via lists.open=
embedded.org wrote:
>>
>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com> <s=
tefan.herbrechtsmeier@weidmueller.com>
>>
>> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmuelle=
r.com> <stefan.herbrechtsmeier@weidmueller.com>
>> ---
>>
>>  .../python/python3-bcrypt-crates.inc          | 84 -------------------
>>  .../python/python3-bcrypt_4.2.1.bb            |  4 +-
>>  2 files changed, 1 insertion(+), 87 deletions(-)
>>  delete mode 100644 meta/recipes-devtools/python/python3-bcrypt-crates.i=
nc
>>
>> So let me as the silly question. This removes the crates.inc file and
>> doesn't appear to add any kind of new list of locked down modules.
>>
>> The list is generated on the fly like gitsm and doesn't require an extra
>> step.
>>
>> This means that inspection tools just using the metadata can't see
>> "into" this recipe any longer for component information.
>>
>> We support and use python code inside the variables and thereby need a
>> preprocessing of the metadata in any case.
>>
>> What do you mean by "component information"?
>>
>> This was
>> something that some people felt strongly that was a necessary part of
>> recipe metadata, for license, security and other manifest activities.
>>
>> Why can't they use the SBOM for this?
>>
>> Are we basically saying that information is now only available after
>> the build takes place?
>>
>> They are only available after a special task run.
>>
>> I'm very worried that the previous discussions didn't reach a
>> conclusion and this is moving the "magic" out of bitbake and into some
>> vendor classes without addressing the concerns previously raised about
>> transparency into the manifests of what is going on behind the scenes.
>>
>> I try to address the concerns but don't realize that the missing
>> information in the recipe is a blocker.
>>
>> This version gives the user the possibility to influence the dependencie=
s
>> via patches or alternative lock file. It creates a vendor folder for eas=
y
>> patch and debug. It integrates the dependencies into the SBOM for securi=
ty
>> tracking.
>>
>> I skipped the license topic for now because the package managers don't
>> handle license integrity. We have to keep the information in the recipe =
but
>> hopefully the license information doesn't change with each update.
>>
>> I don't understand the requirement for the plain inspection. In my
>> opinion external tools should always use a defined output and shouldn't
>> depend on the project internal details. I adapt the existing users of th=
e
>> SRC_URI to include the dynamic SRC_URIs.
>>
>> I appreciate some of the requirements are conflicting.
>>
>> For the record in some recent meetings, I was promised that help would
>> be forthcoming in helping guide this discussion. I therefore left
>> things alone in the hope that would happen. It simply hasn't, probably
>> due to time/work issues, which I can sympathise with but it does mean
>> I'm left doing a bad job of trying to respond to your patches whilst
>> trying to do too many other things badly too. That leaves us both very
>> frustrated.
>>
>> I really want to see you succeed in reworking this and I appreciate the
>> time and effort put into the patches. To make this successful, I know
>> there are key stakeholders who need to buy into it and right now,
>> they're more likely just to keep doing their own things as it is easier
>> since this isn't going the direction they want. A key piece of making
>> this successful is negotiating something which can work for a
>> significant portion of them. I'm spelling all this out since I do at
>> least want to make the situation clear.
>>
>> Yes, I'm very upset the OE community is putting me in this position
>> despite me repeatedly asking for help and that isn't your fault, which
>> just frustrates me more.
>>
>> My problem is the double standards. We support a fetcher which dynamic
>> resolve dependencies and without manual update step since years. Nobody
>> suggests to make the gitsm fetcher obsolete and requests the users to ru=
n
>> an update task after a SRC_URI change to create a .inc file with the
>> SRC_URIs of all the recursive submodules. Nobody complains about the
>> missing components in the recipe.
>>
> There's no double standard, I'd simply say that design decisions of the
> past doesn't mean that there aren't better ways to do something new.
>
> Richard went out of his way to explain the status and what sort of review
> needs to happen, I'll add that while getting frustrated with it is natura=
l,
> pushing back on people doing reviews isn't going to help get things merge=
d,
> it will do the opposite.
>
> There have been plenty of complaints and issues with the gitsm fetcher,
> but the reality is that if someone wants to get at the base components of
> what it is doing, they can do so. I've had to take several of my maintain=
ed
> recipes out of gitsm and back to the base git fetches. The submodules wer=
e
> simply fetching code that didn't build and there was no way to fetch it.
> The gitsm fetcher is also relatively lightly used, much less complicated
> and doesn't need much extra in infrastructure to support it.
>
> Thanks for your insides. There a two main solutions for the problem. Add
> patch support to gitsm so that you could use the git submodule command an=
d
> create a patch or generate a .inc file and manipulate the SRCREVs. I assu=
me
> you would prefer a .inc file. What do you think is the downside of a patc=
h?
>

It is much easier to get a complete view of the file with a drop-in, versus
a patch (depending on the size of the file). You need to know the base
directory, the depth, put in an upstream-status, create it, copy it to your
layer, etc. With a drop-in lock file, I copy it out, edit it, and add it to
my SRC_URI.  Not much difference in the end, but I prefer the drop-in
approach on pretty much any configuration file in my builds, not just this
example.



>
>
>> Whether we have hard requirements and introduce a git submodule support
>> which satisfy the requirements or we accept the advantages of a simple u=
ser
>> interface and minimize the disadvantages.
>>
> Unfortunately in my experience the simple interfaces hiding complexity
> don't help when things go wrong. That's how I ended up where I am with my
> go recipes, and why I ended up tearing my gitsm recipe back into its
> components. There was no way to influence / fix the build otherwise, and
> they didn't support bleeding edge development very well.
>
> Do you have a good example for a problematic go recipe to test my approac=
h?
>

Not right now, the current state is relatively stable as I'm working
towards the LTS release. These have just popped up repeatedly over the
maybe 5+ years (I can't remember how long it has been!) in maintaining
meta-virtualization. I have no doubts (and am not implying) that your
series could adapt my recipes and use all of the go mod infrastructure ..
just with all of the vendoring and go mod efforts over the years, going all
the way back to the actual source code gave a lot more visibility into the
vendor dependencies (and not just what was released for them) and I've used
it many times while debugging runtime issues of the container stacks.


> I'm definitely one of the people Richard is mentioning as a stakeholder,
> and one that could likely just ignore all of this .. but I'm attempting t=
o
> wade into it again.
>
> I am very grateful for that.
>
>
> None of us have the hands on, daily experience with the components at pla=
y
> as you do right now, so patience on your part will be needed as we ask ma=
ny
> not-so-intelligent questions.
>
> That's no problem.
>
>
>> It doesn't matter if we run the resolve function inside a resolve, fetch
>> or update task. The questions is do we want to support dynamic SRC_URIs =
or
>> do we want an manual update task. The task needs to be manual run after =
a
>> SRC_URI change and can produces a lot of noise in the update commit. In =
any
>> case the manual editing of the SRC_URI isn't practical and the users wil=
l
>> use the package manager to update dependencies and its recursive
>> dependencies.
>>
> I don't understand the series quite enough yet to say "why can't we do
> both", if there was a way to abstract / componentize what is generating
> those dynamic SCR_URIS in such a way that an external tool or update task
> could generate them, and if they were already in place the dynamic
> generation wouldn't run at build time, that should keep both modes workin=
g.
>
> If it is desired I can add both variants.
>

Forcing one approach over the other isn't really going to make it mergeable
(or maybe I should say make it adopted by all).

We need to help developers as well as people just doing "load build" for
distros (that should be in a steady state).  I'm under no illusion that the
way I handle the go recipes won't work for everyone either, so I definitely
wouldn't propose it as such.

>
>
>
> I admit to not understanding why we'd be overly concerned about noise in
> the commits (for the dependencies) if they are split into separate files =
in
> the recipe. More information is always better when I'm dealing with the
> updates. I just scroll past it if I'm not interested and filter it if I a=
m.
>
> The problem is to identify the relevant parts. Lets say you update a
> dependency because of an security issue. Afterwards you update the projec=
t
> with a lot of dependency changes. You have to review the complete noise t=
o
> determine if your updated dependency doesn't go backward in its version. =
It
> is much easier to use a patch. After the project update the patch will fa=
il
> or not. If it fails you have a direct focus on the affected dependency. I=
f
> you back port the patch from the project you could simple drop it with th=
e
> next update.
>

I prefer all of the extra information, but maybe that's my kernel
background. It's the same reason why all my recipe / version updates
contain all the short logs between the releases. I can just skip / ignore
the information most of the time, but it comes in handy when looking for a
security issue, etc.

In my go recipes, I have a look at the dependency SRCREVS between updates.
In particular if I'm debugging a runtime issue, that helps me quickly see
if a dependency changed and by how much it changed.

I could do the same with a drop-in lockfile that was in my recipe, since
I'd have the delta readily available and could see the source revisions,
etc.

Of course if a drop-in file was used, we'd want some sort of hash for the
original file it was clobbering, since that indicates an update would be
required (or dropping it, etc).


>
> I feel the pain (and your pain) of this after supporting complicated
> go/mixed language recipes through multiple major releases (and through go=
's
> changing dependency model + bleeding edge code, etc) and needing to track
> what has changed, so I definitely encourage you to keep working on this.
>
> As a compromise we could add a new feature to generate .inc cache files
>> before the main bitbake run. This would eliminate the manual update run =
and
>> the commit noise as well as special fetch, unpack and patch task.
>>
>> Can you elaborate on what you mean by before the main bitbake run ? Woul=
d
> it be still under a single bitbake invokation or would it be multiple run=
s
> (I support multiple runs, so don't take that as a leading question).
>
> I can't answer this questions and need Richard guidance to implement such
> a feature. I would assume that bitbake already track file changes and can
> update its state. The behavior should be similar to a change in the .inc
> file. Bitbake will detect that a "include_cache" file is missing and run =
an
> update_cache task on the recipe. Afterwards bitbake detect a file change =
on
> the "include_cache" file and parse it. We need a possibility to mark
> patches which shouldn't be applied if the "include_cache" file is missing
> because the dependencies are missing. We need to run the fetch, unpack an=
d
> patch task before the update_cache task to generate the .inc file.
>
Aha. Maybe Richard will comment later. I was thinking more about something
that was in two distinct phases, but with some more thinking and
explanation, maybe this is workable as well.

Bruce

--000000000000ccf5f3062df5807f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 12, 2025 at 12:24=
=E2=80=AFPM Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrechtsm=
eier-oss@weidmueller.com">stefan.herbrechtsmeier-oss@weidmueller.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div>
    <div>Am 12.02.2025 um 16:07 schrieb Bruce
      Ashfield:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 12, 2025 at
            9:36=E2=80=AFAM Stefan Herbrechtsmeier via <a href=3D"http://li=
sts.openembedded.org" target=3D"_blank">lists.openembedded.org</a>
            &lt;stefan.herbrechtsmeier-oss=3D<a href=3D"mailto:weidmueller.=
com@lists.openembedded.org" target=3D"_blank">weidmueller.com@lists.openemb=
edded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <div>Am 11.02.2025 um 22:46 schrieb Richard Purdie:<br>
              </div>
              <blockquote type=3D"cite">
                <pre>On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsme=
ier via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.o=
penembedded.org</a> wrote:
</pre>
                <blockquote type=3D"cite">
                  <pre>From: Stefan Herbrechtsmeier <a href=3D"mailto:stefa=
n.herbrechtsmeier@weidmueller.com" target=3D"_blank">&lt;stefan.herbrechtsm=
eier@weidmueller.com&gt;</a>

Signed-off-by: Stefan Herbrechtsmeier <a href=3D"mailto:stefan.herbrechtsme=
ier@weidmueller.com" target=3D"_blank">&lt;stefan.herbrechtsmeier@weidmuell=
er.com&gt;</a>
---

=C2=A0.../python/python3-bcrypt-crates.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 84 -------------------
=C2=A0.../python/<a href=3D"http://python3-bcrypt_4.2.1.bb" target=3D"_blan=
k">python3-bcrypt_4.2.1.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
=C2=A02 files changed, 1 insertion(+), 87 deletions(-)
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3-bcrypt-crates=
.inc
</pre>
                </blockquote>
                <pre>So let me as the silly question. This removes the crat=
es.inc file and
doesn&#39;t appear to add any kind of new list of locked down modules.
</pre>
              </blockquote>
              The list is generated on the fly like gitsm and doesn&#39;t
              require an extra step.<br>
              <br>
              <blockquote type=3D"cite">
                <pre>This means that inspection tools just using the metada=
ta can&#39;t see
&quot;into&quot; this recipe any longer for component information.
</pre>
              </blockquote>
              <p>We support and use python code inside the variables and
                thereby need a preprocessing of the metadata in any
                case.<br>
                <br>
                What do you mean by &quot;component information&quot;?<br>
                <br>
              </p>
              <blockquote type=3D"cite">
                <pre>This was
something that some people felt strongly that was a necessary part of
recipe metadata, for license, security and other manifest activities.</pre>
              </blockquote>
              <p>Why can&#39;t they use the SBOM for this?<br>
                <span style=3D"white-space:pre-wrap">

</span></p>
              <blockquote type=3D"cite">
                <pre>Are we basically saying that information is now only a=
vailable after
the build takes place?
</pre>
              </blockquote>
              They are only available after a special task run.<br>
              <br>
              <blockquote type=3D"cite">
                <pre>I&#39;m very worried that the previous discussions did=
n&#39;t reach a
conclusion and this is moving the &quot;magic&quot; out of bitbake and into=
 some
vendor classes without addressing the concerns previously raised about
transparency into the manifests of what is going on behind the scenes.
</pre>
              </blockquote>
              <p>I try to address the concerns but don&#39;t realize that
                the missing information in the recipe is a blocker.<br>
                <br>
                This version gives the user the possibility to influence
                the dependencies via patches or alternative lock file.
                It creates a vendor folder for easy patch and debug. It
                integrates the dependencies into the SBOM for security
                tracking.<br>
                <br>
                I skipped the license topic for now because the package
                managers don&#39;t handle license integrity. We have to kee=
p
                the information in the recipe but hopefully the license
                information doesn&#39;t change with each update.<br>
                <br>
                I don&#39;t understand the requirement for the plain
                inspection. In my opinion external tools should always
                use a defined output and shouldn&#39;t depend on the projec=
t
                internal details. I adapt the existing users of the
                SRC_URI to include the dynamic SRC_URIs. <br>
                <br>
              </p>
              <blockquote type=3D"cite">
                <pre>I appreciate some of the requirements are conflicting.

For the record in some recent meetings, I was promised that help would
be forthcoming in helping guide this discussion. I therefore left
things alone in the hope that would happen. It simply hasn&#39;t, probably
due to time/work issues, which I can sympathise with but it does mean
I&#39;m left doing a bad job of trying to respond to your patches whilst
trying to do too many other things badly too. That leaves us both very
frustrated.

I really want to see you succeed in reworking this and I appreciate the
time and effort put into the patches. To make this successful, I know
there are key stakeholders who need to buy into it and right now,
they&#39;re more likely just to keep doing their own things as it is easier
since this isn&#39;t going the direction they want. A key piece of making
this successful is negotiating something which can work for a
significant portion of them. I&#39;m spelling all this out since I do at
least want to make the situation clear.

Yes, I&#39;m very upset the OE community is putting me in this position
despite me repeatedly asking for help and that isn&#39;t your fault, which
just frustrates me more.
</pre>
              </blockquote>
              <p>My problem is the double standards. We support a
                fetcher which dynamic resolve dependencies and without
                manual update step since years. Nobody suggests to make
                the gitsm fetcher obsolete and requests the users to run
                an update task after a SRC_URI change to create a .inc
                file with the SRC_URIs of all the recursive submodules.
                Nobody=C2=A0complains about the missing components in the
                recipe.<br>
              </p>
            </div>
          </blockquote>
          <div>
            <div style=3D"font-size:small">There&#39;s
              no double standard, I&#39;d simply say that design decisions
              of the past doesn&#39;t mean that there aren&#39;t better way=
s to
              do something new.</div>
            <div style=3D"font-size:small"><br>
            </div>
            <div style=3D"font-size:small">Richard
              went out of his way to explain the status and what sort of
              review needs to happen, I&#39;ll add that while getting
              frustrated with it is natural, pushing back on people
              doing reviews isn&#39;t going to help get things merged, it
              will do the opposite.</div>
            <div style=3D"font-size:small"><br>
            </div>
            <div style=3D"font-size:small">There
              have been plenty of complaints and issues with the gitsm
              fetcher, but the reality is that if someone wants to get
              at the base components of what it is doing, they can do
              so. I&#39;ve had to take several of my maintained recipes out
              of gitsm and back to the base git fetches. The submodules
              were simply fetching code that didn&#39;t build and there was
              no way to fetch it.=C2=A0 The gitsm fetcher is also relativel=
y
              lightly used, much less complicated and doesn&#39;t need much
              extra in infrastructure to support it.<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Thanks for your insides. There a two main solutions for the
      problem. Add patch support to gitsm so that you could use the git
      submodule command and create a patch or generate a .inc file and
      manipulate the SRCREVs. I assume you would prefer a .inc file. What
      do you think is the downside of a patch?<br></p></div></blockquote><d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">It=
 is much easier to get a complete view of the file with a drop-in, versus a=
 patch (depending on the size of the file). You need to know the base direc=
tory, the depth, put in an upstream-status, create it, copy it to your laye=
r, etc. With a drop-in lock file, I copy it out, edit it, and add it to my =
SRC_URI.=C2=A0 Not much difference in the end, but I prefer the drop-in app=
roach on pretty much any configuration file in my builds, not just this exa=
mple.=C2=A0</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div><p>
      <br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <p> <br>
                Whether we have hard requirements and introduce a git
                submodule support which satisfy the requirements or we
                accept the advantages of a simple user interface and
                minimize the disadvantages.<br>
              </p>
            </div>
          </blockquote>
          <div>
            <div style=3D"font-size:small">Unfortunately
              in my experience the simple interfaces hiding complexity
              don&#39;t help when things go wrong. That&#39;s how I ended u=
p
              where I am with my go recipes, and why I ended up tearing
              my gitsm recipe back into its components. There was no way
              to influence / fix the build otherwise, and they didn&#39;t
              support bleeding edge development very well.<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    Do you have a good example for a problematic go recipe to test my
    approach?<br></div></blockquote><div><br></div><div><div class=3D"gmail=
_default" style=3D"font-size:small">Not right now, the current state is rel=
atively stable as I&#39;m working towards the LTS release. These have just =
popped up repeatedly over the maybe 5+ years (I can&#39;t remember how long=
 it has been!) in maintaining meta-virtualization. I have no doubts (and am=
 not implying) that your series could adapt my recipes and use all of the g=
o mod infrastructure .. just with all of the vendoring and go mod efforts o=
ver the years, going all the way back to the actual source code gave a lot =
more visibility into the vendor dependencies (and not just what was release=
d for them) and I&#39;ve used it many times while debugging runtime issues =
of the container stacks.</div></div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>
            <div style=3D"font-size:small">I&#39;m
              definitely one of the people Richard is mentioning as a
              stakeholder, and one that could likely just ignore all of
              this .. but I&#39;m attempting to wade into it again.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>I am very grateful for that.<br>
      <br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div style=3D"font-size:small"><br>
          </div>
          <div style=3D"font-size:small">None of us
            have the hands on, daily experience with the components at
            play as you do right now, so patience on your part will be
            needed as we ask many not-so-intelligent questions.<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>That&#39;s no problem.<br>
      <br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <p> <br>
                It doesn&#39;t matter if we run the resolve function inside
                a resolve, fetch or=C2=A0update task. The questions is do w=
e
                want to support dynamic SRC_URIs or do we want an manual
                update task. The task needs to be manual run after a
                SRC_URI change and can produces a lot of noise in the
                update commit. In any case the manual editing of the
                SRC_URI isn&#39;t practical and the users will use the
                package manager to update dependencies and its recursive
                dependencies.<br>
              </p>
            </div>
          </blockquote>
          <div>
            <div style=3D"font-size:small">I don&#39;t
              understand the series quite enough yet to say &quot;why can&#=
39;t
              we do both&quot;, if there was a way to abstract /
              componentize=C2=A0what is generating those dynamic=C2=A0SCR_U=
RIS in
              such a way that an external tool or update task could
              generate them, and if they were already in place the
              dynamic generation wouldn&#39;t run at build time, that shoul=
d
              keep both modes working.<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    If it is desired I can add both variants.</div></blockquote><div><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">Forcing one appr=
oach over the other isn&#39;t really going to make it mergeable (or maybe I=
 should say make it adopted by all).=C2=A0</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">We need to help developers as well as people just doing &=
quot;load build&quot; for distros (that should be in a steady state).=C2=A0=
 I&#39;m under no illusion that the way I handle the go recipes won&#39;t w=
ork for everyone either, so I definitely wouldn&#39;t propose it as such.</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div> <br>
    <br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>
            <div style=3D"font-size:small">I admit
              to not understanding why we&#39;d be overly concerned about
              noise in the commits (for the dependencies) if they are
              split into separate files in the recipe. More information
              is always better when I&#39;m dealing with the updates. I jus=
t
              scroll past it if I&#39;m not interested and filter it if I
              am.<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    The problem is to identify the relevant parts. Lets say you update a
    dependency because of an security issue. Afterwards you update the
    project with a lot of dependency changes. You have to review the
    complete noise to determine if your updated dependency doesn&#39;t go
    backward in its version. It is much easier to use a patch. After the
    project update the patch will fail or not. If it fails you have a
    direct focus on the affected dependency. If you back port the patch
    from the project you could simple drop it with the next update.</div></=
blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-s=
ize:small">I prefer all of the extra information, but maybe that&#39;s my k=
ernel background. It&#39;s the same reason why all my recipe / version upda=
tes contain all the short logs between the releases. I can just skip / igno=
re the information most of the time, but it comes in handy when looking for=
 a security issue, etc.</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I=
n my go recipes, I have a look at the dependency SRCREVS between updates. I=
n particular if I&#39;m debugging a runtime issue, that helps me quickly se=
e if a dependency changed and by how much it changed.=C2=A0</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">I could do the same with a drop-in lockf=
ile that was in my recipe, since I&#39;d have the delta readily available a=
nd could see the source revisions, etc.=C2=A0</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Of course if a drop-in file was used, we&#39;d want so=
me sort of hash for the original file it was clobbering, since that indicat=
es an update would be required (or dropping it, etc).</div></div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div> <br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div style=3D"font-size:small">I feel the
            pain (and your pain) of this after supporting complicated
            go/mixed language recipes through multiple=C2=A0major releases
            (and through go&#39;s changing dependency model + bleeding edge
            code, etc) and needing to track what has changed, so I
            definitely encourage you to keep working on this.</div>
          <div style=3D"font-size:small"><br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <p> </p>
              <p>As a compromise we could add a new feature to generate
                .inc cache files before the main bitbake run. This would
                eliminate the manual update run and the commit noise as
                well as special fetch, unpack and patch task.<br>
                <br>
              </p>
            </div>
          </blockquote>
          <div style=3D"font-size:small">Can you
            elaborate on what you mean by before the main bitbake run ?
            Would it be still under a single bitbake invokation or would
            it be multiple runs (I support multiple runs, so don&#39;t take
            that as a leading question).<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>I can&#39;t answer this questions and need Richard guidance to
      implement such a feature. I would assume that bitbake already
      track file changes and can update its state. The behavior should
      be similar to a change in the .inc file. Bitbake will detect that
      a &quot;include_cache&quot; file is missing and run an update_cache t=
ask on
      the recipe. Afterwards bitbake detect a file change on the
      &quot;include_cache&quot; file and parse it. We need a possibility to=
 mark
      patches which shouldn&#39;t be applied if the &quot;include_cache&quo=
t; file is
      missing because the dependencies are missing. We need to run the
      fetch, unpack and patch task before the update_cache task to
      generate the .inc file.</p>
  </div>

</blockquote></div><div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Aha. Maybe Richard will comment later. I was thinking more about someth=
ing that was in two distinct phases, but with some more thinking and explan=
ation, maybe this is workable as well.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Bruce</div></div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div></div>

--000000000000ccf5f3062df5807f--

