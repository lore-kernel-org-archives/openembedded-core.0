Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43909C021A6
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 17:07:46 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.1430.1739466465028769815
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 09:07:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pp39FVQg;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f441791e40so1701120a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 09:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739466464; x=1740071264; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GAmjQx0vEb/2BmErQldzbl2Z7Yu/5ajJC6DlVC1/yL0=;
        b=Pp39FVQg3nR4owysGpNebT4CbW5JlYmeDOFyXEWMnRwifZGaB0nMS/R4tpbA7qP8ID
         vhbqnQUy+E09U0E+qE3TfT8syE8Xi4fslf3L3IWZVFapGMs8M1sA5/UbLQ7MPARMyR6X
         Gm7SU4zOOQ6KZjkiE2TCla06FzUG2R9ufaOEWT4vcgZBf9/+y+ec3MknlylcoOHf5VT2
         IxqXiMvywxsIFQLZu2WRn8ePppUhtBGWowKQ7m8dt4dlvY18I09v3lkU5cm4RL08rFet
         PSGCgYVLsQIGpzQ4m53dtosTIHfahOGOfcht8m8QpwR1p4vLLoR+OIMRAsgbxG1gWVl5
         lBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739466464; x=1740071264;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GAmjQx0vEb/2BmErQldzbl2Z7Yu/5ajJC6DlVC1/yL0=;
        b=Sni8uwX+ipXmo1sL70JI6xBqVgjGnpk3j1yufeyQzVzbXrj09oXCY6XkSl0orN53vX
         k/wm2MJ8l3UmETrqlwAFmwgMcmQlfsedKaDBdnzktray1XH1XWQ9OB7FKRxJAxz7l/LO
         VKUhKTz5wZEURo8M3ay1Udao8w4LcJrDUAMiNo02gku20Y0yx1vxychl9rpG8Ke+TkFs
         kVjlarNujMQgP+vMePMn8c8lWgd/FMleN2TuEJCK2N67r9ufib72px8J7PZUlj7CV0Ta
         H0oQqvfnm9wEApIQbC13hfBxcN9lW2TSmnY0SXEJJgqX95JNkix2IEvkWBUOD/wdMIBz
         zBZg==
X-Forwarded-Encrypted: i=1; AJvYcCVV04WBkJFoeV8NMZKZ2sWjq0Db5riqiw5yX3LRUc2nGlBVhyKCFDvbCLiB12E9q9bLxWUaEp6qRBaW96X+BYHdMQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxvkblavwvm9BF3O2ZH0nGnQL8I6SCwPXb7Xij534j4GPkC81xo
	PnEFAzy8Sg+h1nmxoaNlmriS7ZCWBYJtIJNTKaGg/lUn1fBZtmBRD1suYQvUNgw86Q94590uZ6F
	xjVJEEyAl+Yna7IMUCsaCNjg3F+U=
X-Gm-Gg: ASbGnctCX6q2YlIkNo5tSY0hHjNDrUrDjATQW9IJEYJmFP3NPfTh0I42jGCUa0+Kzhu
	H3oLf33/O1xRZJXih0VTtSC+0o5f/wTo9/E67ho8zmSshWBrCl29KfPV2Dq/5oAcFYJXAzLIo
X-Google-Smtp-Source: AGHT+IGtvCZB0LO5ko5BMh4WTaSbJEdQfaVLRtYzkbeSCakIsIj5oVtya9Bxxk3d+x3NSM5aT35I9/eTd2OxqyPVDWk=
X-Received: by 2002:a17:90a:c88e:b0:2fa:20f4:d277 with SMTP id
 98e67ed59e1d1-2fbf5c59edamr12663745a91.24.1739466464307; Thu, 13 Feb 2025
 09:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-21-stefan.herbrechtsmeier-oss@weidmueller.com>
 <d933e37f2be3e98c72f99191b504efe607d50c96.camel@linuxfoundation.org>
 <f2a970ab-14da-4108-a050-04851a7bd480@weidmueller.com> <CADkTA4MZozK1oBwM6-=FShj2N-kke4w9=FDkTrd668XkvjsTbw@mail.gmail.com>
 <7848a428-7193-4597-9b85-84e7dd4d3b32@weidmueller.com> <CADkTA4MtM9ZbakC-u0Qk8bQjcOk6uYuYYhFagWR3fmNqC7gWrw@mail.gmail.com>
 <ee106ec7-e74c-4c7d-b233-17f8dc0719f9@weidmueller.com>
In-Reply-To: <ee106ec7-e74c-4c7d-b233-17f8dc0719f9@weidmueller.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 13 Feb 2025 12:07:33 -0500
X-Gm-Features: AWEUYZmTXZndB87mqzVbh3ym8zmx5lGj3ABXjAjbsscYe5KPdkXadoVGvwGkwvk
Message-ID: <CADkTA4N3xRpCrzANB=nTs+qW+pOpnUnbfN47un=9MfwzjCzK8w@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 21/30] python3-bcrypt: mirgrate to vendor
 cargo class
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="000000000000b4382a062e0918ae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 17:07:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211360

--000000000000b4382a062e0918ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 7:45=E2=80=AFAM Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

> Am 12.02.2025 um 18:45 schrieb Bruce Ashfield:
>
>
>
> On Wed, Feb 12, 2025 at 12:24=E2=80=AFPM Stefan Herbrechtsmeier <
> stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>
>> Am 12.02.2025 um 16:07 schrieb Bruce Ashfield:
>>
>> On Wed, Feb 12, 2025 at 9:36=E2=80=AFAM Stefan Herbrechtsmeier via
>> lists.openembedded.org <stefan.herbrechtsmeier-oss=3D
>> weidmueller.com@lists.openembedded.org> wrote:
>>
>>> Am 11.02.2025 um 22:46 schrieb Richard Purdie:
>>>
>>> On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier via lists.ope=
nembedded.org wrote:
>>>
>>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com> <=
stefan.herbrechtsmeier@weidmueller.com>
>>>
>>> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmuell=
er.com> <stefan.herbrechtsmeier@weidmueller.com>
>>> ---
>>>
>>>  .../python/python3-bcrypt-crates.inc          | 84 -------------------
>>>  .../python/python3-bcrypt_4.2.1.bb            |  4 +-
>>>  2 files changed, 1 insertion(+), 87 deletions(-)
>>>  delete mode 100644 meta/recipes-devtools/python/python3-bcrypt-crates.=
inc
>>>
>>> So let me as the silly question. This removes the crates.inc file and
>>> doesn't appear to add any kind of new list of locked down modules.
>>>
>>> The list is generated on the fly like gitsm and doesn't require an extr=
a
>>> step.
>>>
>>> This means that inspection tools just using the metadata can't see
>>> "into" this recipe any longer for component information.
>>>
>>> We support and use python code inside the variables and thereby need a
>>> preprocessing of the metadata in any case.
>>>
>>> What do you mean by "component information"?
>>>
>>> This was
>>> something that some people felt strongly that was a necessary part of
>>> recipe metadata, for license, security and other manifest activities.
>>>
>>> Why can't they use the SBOM for this?
>>>
>>> Are we basically saying that information is now only available after
>>> the build takes place?
>>>
>>> They are only available after a special task run.
>>>
>>> I'm very worried that the previous discussions didn't reach a
>>> conclusion and this is moving the "magic" out of bitbake and into some
>>> vendor classes without addressing the concerns previously raised about
>>> transparency into the manifests of what is going on behind the scenes.
>>>
>>> I try to address the concerns but don't realize that the missing
>>> information in the recipe is a blocker.
>>>
>>> This version gives the user the possibility to influence the
>>> dependencies via patches or alternative lock file. It creates a vendor
>>> folder for easy patch and debug. It integrates the dependencies into th=
e
>>> SBOM for security tracking.
>>>
>>> I skipped the license topic for now because the package managers don't
>>> handle license integrity. We have to keep the information in the recipe=
 but
>>> hopefully the license information doesn't change with each update.
>>>
>>> I don't understand the requirement for the plain inspection. In my
>>> opinion external tools should always use a defined output and shouldn't
>>> depend on the project internal details. I adapt the existing users of t=
he
>>> SRC_URI to include the dynamic SRC_URIs.
>>>
>>> I appreciate some of the requirements are conflicting.
>>>
>>> For the record in some recent meetings, I was promised that help would
>>> be forthcoming in helping guide this discussion. I therefore left
>>> things alone in the hope that would happen. It simply hasn't, probably
>>> due to time/work issues, which I can sympathise with but it does mean
>>> I'm left doing a bad job of trying to respond to your patches whilst
>>> trying to do too many other things badly too. That leaves us both very
>>> frustrated.
>>>
>>> I really want to see you succeed in reworking this and I appreciate the
>>> time and effort put into the patches. To make this successful, I know
>>> there are key stakeholders who need to buy into it and right now,
>>> they're more likely just to keep doing their own things as it is easier
>>> since this isn't going the direction they want. A key piece of making
>>> this successful is negotiating something which can work for a
>>> significant portion of them. I'm spelling all this out since I do at
>>> least want to make the situation clear.
>>>
>>> Yes, I'm very upset the OE community is putting me in this position
>>> despite me repeatedly asking for help and that isn't your fault, which
>>> just frustrates me more.
>>>
>>> My problem is the double standards. We support a fetcher which dynamic
>>> resolve dependencies and without manual update step since years. Nobody
>>> suggests to make the gitsm fetcher obsolete and requests the users to r=
un
>>> an update task after a SRC_URI change to create a .inc file with the
>>> SRC_URIs of all the recursive submodules. Nobody complains about the
>>> missing components in the recipe.
>>>
>> There's no double standard, I'd simply say that design decisions of the
>> past doesn't mean that there aren't better ways to do something new.
>>
>> Richard went out of his way to explain the status and what sort of revie=
w
>> needs to happen, I'll add that while getting frustrated with it is natur=
al,
>> pushing back on people doing reviews isn't going to help get things merg=
ed,
>> it will do the opposite.
>>
>> There have been plenty of complaints and issues with the gitsm fetcher,
>> but the reality is that if someone wants to get at the base components o=
f
>> what it is doing, they can do so. I've had to take several of my maintai=
ned
>> recipes out of gitsm and back to the base git fetches. The submodules we=
re
>> simply fetching code that didn't build and there was no way to fetch it.
>> The gitsm fetcher is also relatively lightly used, much less complicated
>> and doesn't need much extra in infrastructure to support it.
>>
>> Thanks for your insides. There a two main solutions for the problem. Add
>> patch support to gitsm so that you could use the git submodule command a=
nd
>> create a patch or generate a .inc file and manipulate the SRCREVs. I ass=
ume
>> you would prefer a .inc file. What do you think is the downside of a pat=
ch?
>>
>
> It is much easier to get a complete view of the file with a drop-in,
> versus a patch (depending on the size of the file). You need to know the
> base directory, the depth, put in an upstream-status, create it, copy it =
to
> your layer, etc. With a drop-in lock file, I copy it out, edit it, and ad=
d
> it to my SRC_URI.  Not much difference in the end, but I prefer the drop-=
in
> approach on pretty much any configuration file in my builds, not just thi=
s
> example.
>
> Is a drop-in lock file okay for you or do you require a support to
> generate .inc files?
>
If the drop-in lock file is a one by one listing of dependencies that can
be mapped to fetches, then it serves the same purpose as the .inc file, so
that would be fine with me. But I'd have to see what the implementation
looked like to be sure!



>
>
>>
>>> Whether we have hard requirements and introduce a git submodule support
>>> which satisfy the requirements or we accept the advantages of a simple =
user
>>> interface and minimize the disadvantages.
>>>
>> Unfortunately in my experience the simple interfaces hiding complexity
>> don't help when things go wrong. That's how I ended up where I am with m=
y
>> go recipes, and why I ended up tearing my gitsm recipe back into its
>> components. There was no way to influence / fix the build otherwise, and
>> they didn't support bleeding edge development very well.
>>
>> Do you have a good example for a problematic go recipe to test my
>> approach?
>>
>
> Not right now, the current state is relatively stable as I'm working
> towards the LTS release. These have just popped up repeatedly over the
> maybe 5+ years (I can't remember how long it has been!) in maintaining
> meta-virtualization. I have no doubts (and am not implying) that your
> series could adapt my recipes and use all of the go mod infrastructure ..
> just with all of the vendoring and go mod efforts over the years, going a=
ll
> the way back to the actual source code gave a lot more visibility into th=
e
> vendor dependencies (and not just what was released for them) and I've us=
ed
> it many times while debugging runtime issues of the container stacks.
>
>
>> I'm definitely one of the people Richard is mentioning as a stakeholder,
>> and one that could likely just ignore all of this .. but I'm attempting =
to
>> wade into it again.
>>
>> I am very grateful for that.
>>
>>
>> None of us have the hands on, daily experience with the components at
>> play as you do right now, so patience on your part will be needed as we =
ask
>> many not-so-intelligent questions.
>>
>> That's no problem.
>>
>>
>>> It doesn't matter if we run the resolve function inside a resolve, fetc=
h
>>> or update task. The questions is do we want to support dynamic SRC_URIs=
 or
>>> do we want an manual update task. The task needs to be manual run after=
 a
>>> SRC_URI change and can produces a lot of noise in the update commit. In=
 any
>>> case the manual editing of the SRC_URI isn't practical and the users wi=
ll
>>> use the package manager to update dependencies and its recursive
>>> dependencies.
>>>
>> I don't understand the series quite enough yet to say "why can't we do
>> both", if there was a way to abstract / componentize what is generating
>> those dynamic SCR_URIS in such a way that an external tool or update tas=
k
>> could generate them, and if they were already in place the dynamic
>> generation wouldn't run at build time, that should keep both modes worki=
ng.
>>
>> If it is desired I can add both variants.
>>
>
> Forcing one approach over the other isn't really going to make it
> mergeable (or maybe I should say make it adopted by all).
>
> We need to help developers as well as people just doing "load build" for
> distros (that should be in a steady state).  I'm under no illusion that t=
he
> way I handle the go recipes won't work for everyone either, so I definite=
ly
> wouldn't propose it as such.
>
> The disadvantage of two approach is that you double the issues. It is muc=
h
> simpler if we always depend on the lock file and only support embedded an=
d
> drop-in lock files. I can optimize the generated SRC_URIs but wouldn't
> support the manipulation of the SRC_URI because of it unforeseeable
> consequences. We didn't know which commands of the package manager depend=
s
> on the lock file and I would avoid the regeneration of the lock file.
>

Agreed that we need something maintainable, but we can't just forget about
the developer use case. We need to be able to support iterative, developer
workflows. This is something that we've always tried to do with the kernel
workflows, they aren't perfect, but those modes of working are considered.



>
> I admit to not understanding why we'd be overly concerned about noise in
>> the commits (for the dependencies) if they are split into separate files=
 in
>> the recipe. More information is always better when I'm dealing with the
>> updates. I just scroll past it if I'm not interested and filter it if I =
am.
>>
>> The problem is to identify the relevant parts. Lets say you update a
>> dependency because of an security issue. Afterwards you update the proje=
ct
>> with a lot of dependency changes. You have to review the complete noise =
to
>> determine if your updated dependency doesn't go backward in its version.=
 It
>> is much easier to use a patch. After the project update the patch will f=
ail
>> or not. If it fails you have a direct focus on the affected dependency. =
If
>> you back port the patch from the project you could simple drop it with t=
he
>> next update.
>>
>
> I prefer all of the extra information, but maybe that's my kernel
> background. It's the same reason why all my recipe / version updates
> contain all the short logs between the releases. I can just skip / ignore
> the information most of the time, but it comes in handy when looking for =
a
> security issue, etc.
>
> Maybe we could add the dynamic dependencies to the buildhistory.
>

That would make buildhistory a requirement, which is something (as an
example) that I don't use. I'm just talking about something that goes along
with the git history of the recipe updates. All the information in one
place. I wouldn't get to hung up on this right now, as it would be simple
enough to commit changes to lock files, etc, with generated long logs that
contained all the information. That is outside of what this series needs to
consider.



>
> In my go recipes, I have a look at the dependency SRCREVS between updates=
.
> In particular if I'm debugging a runtime issue, that helps me quickly see
> if a dependency changed and by how much it changed.
>
> I could do the same with a drop-in lockfile that was in my recipe, since
> I'd have the delta readily available and could see the source revisions,
> etc.
>
> Of course if a drop-in file was used, we'd want some sort of hash for the
> original file it was clobbering, since that indicates an update would be
> required (or dropping it, etc).
>
>
>>
>> I feel the pain (and your pain) of this after supporting complicated
>> go/mixed language recipes through multiple major releases (and through g=
o's
>> changing dependency model + bleeding edge code, etc) and needing to trac=
k
>> what has changed, so I definitely encourage you to keep working on this.
>>
>> As a compromise we could add a new feature to generate .inc cache files
>>> before the main bitbake run. This would eliminate the manual update run=
 and
>>> the commit noise as well as special fetch, unpack and patch task.
>>>
>>> Can you elaborate on what you mean by before the main bitbake run ?
>> Would it be still under a single bitbake invokation or would it be multi=
ple
>> runs (I support multiple runs, so don't take that as a leading question)=
.
>>
>> I can't answer this questions and need Richard guidance to implement suc=
h
>> a feature. I would assume that bitbake already track file changes and ca=
n
>> update its state. The behavior should be similar to a change in the .inc
>> file. Bitbake will detect that a "include_cache" file is missing and run=
 an
>> update_cache task on the recipe. Afterwards bitbake detect a file change=
 on
>> the "include_cache" file and parse it. We need a possibility to mark
>> patches which shouldn't be applied if the "include_cache" file is missin=
g
>> because the dependencies are missing. We need to run the fetch, unpack a=
nd
>> patch task before the update_cache task to generate the .inc file.
>>
> Aha. Maybe Richard will comment later. I was thinking more about somethin=
g
> that was in two distinct phases, but with some more thinking and
> explanation, maybe this is workable as well.
>
> This is only needed if we need the dynamic SRC_URIs outside of bitbake in
> the common bitbake format (SRC_URI +=3D "..."). Otherwise we could save t=
he
> information inside the WORKDIR and depend on the sstate cache.
>

I think we are describing different things again. I'm just looking for the
ability to run some of the tasks separately and do it in two distinct
steps. So that wouldn't involve WORKDIR or sstate, but would just generate
the lock or .inc file, or whatever. And then have the build use that file
later.

Bruce

--000000000000b4382a062e0918ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 13, 2025 at 7:45=
=E2=80=AFAM Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrechtsm=
eier-oss@weidmueller.com">stefan.herbrechtsmeier-oss@weidmueller.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div>
    <div>Am 12.02.2025 um 18:45 schrieb Bruce
      Ashfield:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">
          <div style=3D"font-size:small"><br>
          </div>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 12, 2025 at
            12:24=E2=80=AFPM Stefan Herbrechtsmeier &lt;<a href=3D"mailto:s=
tefan.herbrechtsmeier-oss@weidmueller.com" target=3D"_blank">stefan.herbrec=
htsmeier-oss@weidmueller.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <div>Am 12.02.2025 um 16:07 schrieb Bruce Ashfield:<br>
              </div>
              <blockquote type=3D"cite">
                <div dir=3D"ltr">
                  <div class=3D"gmail_quote">
                    <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 12,
                      2025 at 9:36=E2=80=AFAM Stefan Herbrechtsmeier via <a=
 href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedde=
d.org</a>
                      &lt;stefan.herbrechtsmeier-oss=3D<a href=3D"mailto:we=
idmueller.com@lists.openembedded.org" target=3D"_blank">weidmueller.com@lis=
ts.openembedded.org</a>&gt;
                      wrote:<br>
                    </div>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                      <div>
                        <div>Am 11.02.2025 um 22:46 schrieb Richard
                          Purdie:<br>
                        </div>
                        <blockquote type=3D"cite">
                          <pre>On Tue, 2025-02-11 at 16:00 +0100, Stefan He=
rbrechtsmeier via <a href=3D"http://lists.openembedded.org" target=3D"_blan=
k">lists.openembedded.org</a> wrote:
</pre>
                          <blockquote type=3D"cite">
                            <pre>From: Stefan Herbrechtsmeier <a href=3D"ma=
ilto:stefan.herbrechtsmeier@weidmueller.com" target=3D"_blank">&lt;stefan.h=
erbrechtsmeier@weidmueller.com&gt;</a>

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
                          <pre>So let me as the silly question. This remove=
s the crates.inc file and
doesn&#39;t appear to add any kind of new list of locked down modules.
</pre>
                        </blockquote>
                        The list is generated on the fly like gitsm and
                        doesn&#39;t require an extra step.<br>
                        <br>
                        <blockquote type=3D"cite">
                          <pre>This means that inspection tools just using =
the metadata can&#39;t see
&quot;into&quot; this recipe any longer for component information.
</pre>
                        </blockquote>
                        <p>We support and use python code inside the
                          variables and thereby need a preprocessing of
                          the metadata in any case.<br>
                          <br>
                          What do you mean by &quot;component information&q=
uot;?<br>
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
                          <pre>Are we basically saying that information is =
now only available after
the build takes place?
</pre>
                        </blockquote>
                        They are only available after a special task
                        run.<br>
                        <br>
                        <blockquote type=3D"cite">
                          <pre>I&#39;m very worried that the previous discu=
ssions didn&#39;t reach a
conclusion and this is moving the &quot;magic&quot; out of bitbake and into=
 some
vendor classes without addressing the concerns previously raised about
transparency into the manifests of what is going on behind the scenes.
</pre>
                        </blockquote>
                        <p>I try to address the concerns but don&#39;t
                          realize that the missing information in the
                          recipe is a blocker.<br>
                          <br>
                          This version gives the user the possibility to
                          influence the dependencies via patches or
                          alternative lock file. It creates a vendor
                          folder for easy patch and debug. It integrates
                          the dependencies into the SBOM for security
                          tracking.<br>
                          <br>
                          I skipped the license topic for now because
                          the package managers don&#39;t handle license
                          integrity. We have to keep the information in
                          the recipe but hopefully the license
                          information doesn&#39;t change with each update.<=
br>
                          <br>
                          I don&#39;t understand the requirement for the
                          plain inspection. In my opinion external tools
                          should always use a defined output and
                          shouldn&#39;t depend on the project internal
                          details. I adapt the existing users of the
                          SRC_URI to include the dynamic SRC_URIs. <br>
                          <br>
                        </p>
                        <blockquote type=3D"cite">
                          <pre>I appreciate some of the requirements are co=
nflicting.

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
                        <p>My problem is the double standards. We
                          support a fetcher which dynamic resolve
                          dependencies and without manual update step
                          since years. Nobody suggests to make the gitsm
                          fetcher obsolete and requests the users to run
                          an update task after a SRC_URI change to
                          create a .inc file with the SRC_URIs of all
                          the recursive submodules. Nobody=C2=A0complains
                          about the missing components in the recipe.<br>
                        </p>
                      </div>
                    </blockquote>
                    <div>
                      <div style=3D"font-size:small">There&#39;s no double
                        standard, I&#39;d simply say that design decisions
                        of the past doesn&#39;t mean that there aren&#39;t
                        better ways to do something new.</div>
                      <div style=3D"font-size:small"><br>
                      </div>
                      <div style=3D"font-size:small">Richard went out of
                        his way to explain the status and what sort of
                        review needs to happen, I&#39;ll add that while
                        getting frustrated with it is natural, pushing
                        back on people doing reviews isn&#39;t going to hel=
p
                        get things merged, it will do the opposite.</div>
                      <div style=3D"font-size:small"><br>
                      </div>
                      <div style=3D"font-size:small">There have been
                        plenty of complaints and issues with the gitsm
                        fetcher, but the reality is that if someone
                        wants to get at the base components of what it
                        is doing, they can do so. I&#39;ve had to take
                        several of my maintained recipes out of gitsm
                        and back to the base git fetches. The submodules
                        were simply fetching code that didn&#39;t build and
                        there was no way to fetch it.=C2=A0 The gitsm fetch=
er
                        is also relatively lightly used, much less
                        complicated and doesn&#39;t need much extra in
                        infrastructure to support it.<br>
                      </div>
                    </div>
                  </div>
                </div>
              </blockquote>
              <p>Thanks for your insides. There a two main solutions for
                the problem. Add patch support to gitsm so that you
                could use the git submodule command and create a patch
                or generate a .inc file and manipulate the SRCREVs. I
                assume you would prefer a .inc file. What do you think
                is the downside of a patch?<br>
              </p>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div style=3D"font-size:small">It is
              much easier to get a complete view of the file with a
              drop-in, versus a patch (depending on the size of the
              file). You need to know the base directory, the depth, put
              in an upstream-status, create it, copy it to your layer,
              etc. With a drop-in lock file, I copy it out, edit it, and
              add it to my SRC_URI.=C2=A0 Not much difference in the end, b=
ut
              I prefer the drop-in approach on pretty much any
              configuration file in my builds, not just this example. <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Is a drop-in lock file okay for you or do you require a support
      to generate .inc files?<br></p></div></blockquote><div><div class=3D"=
gmail_default" style=3D"font-size:small">If the drop-in lock file is a one =
by one listing of dependencies that can be mapped to fetches, then it serve=
s the same purpose as the .inc file, so that would be fine with me. But I&#=
39;d have to see what the implementation looked like to be sure!</div><br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v><p>
      <br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <p> <br>
              </p>
              <blockquote type=3D"cite">
                <div dir=3D"ltr">
                  <div class=3D"gmail_quote">
                    <blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                      <div>
                        <p> <br>
                          Whether we have hard requirements and
                          introduce a git submodule support which
                          satisfy the requirements or we accept the
                          advantages of a simple user interface and
                          minimize the disadvantages.<br>
                        </p>
                      </div>
                    </blockquote>
                    <div>
                      <div style=3D"font-size:small">Unfortunately in my
                        experience the simple interfaces hiding
                        complexity don&#39;t help when things go wrong.
                        That&#39;s how I ended up where I am with my go
                        recipes, and why I ended up tearing my gitsm
                        recipe back into its components. There was no
                        way to influence / fix the build otherwise, and
                        they didn&#39;t support bleeding edge development
                        very well.<br>
                      </div>
                    </div>
                  </div>
                </div>
              </blockquote>
              Do you have a good example for a problematic go recipe to
              test my approach?<br>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div style=3D"font-size:small">Not right
              now, the current state is relatively stable as I&#39;m workin=
g
              towards the LTS release. These have just popped up
              repeatedly over the maybe 5+ years (I can&#39;t remember how
              long it has been!) in maintaining meta-virtualization. I
              have no doubts (and am not implying) that your series
              could adapt my recipes and use all of the go mod
              infrastructure .. just with all of the vendoring and go
              mod efforts over the years, going all the way back to the
              actual source code gave a lot more visibility into the
              vendor dependencies (and not just what was released for
              them) and I&#39;ve used it many times while debugging runtime
              issues of the container stacks.</div>
          </div>
          <div><br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div> <br>
              <blockquote type=3D"cite">
                <div dir=3D"ltr">
                  <div class=3D"gmail_quote">
                    <div>
                      <div style=3D"font-size:small">I&#39;m definitely one=
 of
                        the people Richard is mentioning as a
                        stakeholder, and one that could likely just
                        ignore all of this .. but I&#39;m attempting to wad=
e
                        into it again.</div>
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
                    <div style=3D"font-size:small">None of us have the
                      hands on, daily experience with the components at
                      play as you do right now, so patience on your part
                      will be needed as we ask many not-so-intelligent
                      questions.<br>
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
                    <blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                      <div>
                        <p> <br>
                          It doesn&#39;t matter if we run the resolve
                          function inside a resolve, fetch or=C2=A0update
                          task. The questions is do we want to support
                          dynamic SRC_URIs or do we want an manual
                          update task. The task needs to be manual run
                          after a SRC_URI change and can produces a lot
                          of noise in the update commit. In any case the
                          manual editing of the SRC_URI isn&#39;t practical
                          and the users will use the package manager to
                          update dependencies and its recursive
                          dependencies.<br>
                        </p>
                      </div>
                    </blockquote>
                    <div>
                      <div style=3D"font-size:small">I don&#39;t understand
                        the series quite enough yet to say &quot;why can&#3=
9;t we
                        do both&quot;, if there was a way to abstract /
                        componentize=C2=A0what is generating those
                        dynamic=C2=A0SCR_URIS in such a way that an externa=
l
                        tool or update task could generate them, and if
                        they were already in place the dynamic
                        generation wouldn&#39;t run at build time, that
                        should keep both modes working.<br>
                      </div>
                    </div>
                  </div>
                </div>
              </blockquote>
              If it is desired I can add both variants.</div>
          </blockquote>
          <div><br>
          </div>
          <div style=3D"font-size:small">Forcing one
            approach over the other isn&#39;t really going to make it
            mergeable (or maybe I should say make it adopted by all).=C2=A0=
</div>
          <div style=3D"font-size:small"><br>
          </div>
          <div style=3D"font-size:small">We need to
            help developers as well as people just doing &quot;load build&q=
uot;
            for distros (that should be in a steady state).=C2=A0 I&#39;m u=
nder
            no illusion that the way I handle the go recipes won&#39;t work
            for everyone either, so I definitely wouldn&#39;t propose it as
            such.<br>
          </div>
        </div>
      </div>
    </blockquote>
    The disadvantage of two approach is that you double the issues. It
    is much simpler if we always depend on the lock file and only
    support embedded and drop-in lock files. I can optimize the
    generated SRC_URIs but wouldn&#39;t support the manipulation of the
    SRC_URI because of it unforeseeable consequences. We didn&#39;t know
    which commands of the package manager depends on the lock file and I
    would avoid the regeneration of the lock file.<br></div></blockquote><d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Ag=
reed that we need something maintainable, but we can&#39;t just forget abou=
t the developer use case. We need to be able to support iterative, develope=
r workflows. This is something that we&#39;ve always tried to do with the k=
ernel workflows, they aren&#39;t perfect, but those modes of working are co=
nsidered.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <blockquote type=3D"cite">
                <div dir=3D"ltr">
                  <div class=3D"gmail_quote">
                    <div>
                      <div style=3D"font-size:small">I admit to not
                        understanding why we&#39;d be overly concerned abou=
t
                        noise in the commits (for the dependencies) if
                        they are split into separate files in the
                        recipe. More information is always better when
                        I&#39;m dealing with the updates. I just scroll pas=
t
                        it if I&#39;m not interested and filter it if I am.=
<br>
                      </div>
                    </div>
                  </div>
                </div>
              </blockquote>
              The problem is to identify the relevant parts. Lets say
              you update a dependency because of an security issue.
              Afterwards you update the project with a lot of dependency
              changes. You have to review the complete noise to
              determine if your updated dependency doesn&#39;t go backward
              in its version. It is much easier to use a patch. After
              the project update the patch will fail or not. If it fails
              you have a direct focus on the affected dependency. If you
              back port the patch from the project you could simple drop
              it with the next update.</div>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div style=3D"font-size:small">I prefer
              all of the extra information, but maybe that&#39;s my kernel
              background. It&#39;s the same reason why all my recipe /
              version updates contain all the short logs between the
              releases. I can just skip / ignore the information most of
              the time, but it comes in handy when looking for a
              security issue, etc.<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    Maybe we could add the dynamic dependencies to the buildhistory.<br></d=
iv></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"f=
ont-size:small">That would make buildhistory a requirement, which is someth=
ing (as an example) that I don&#39;t use. I&#39;m just talking about someth=
ing that goes along with the git history of the recipe updates. All the inf=
ormation in one place. I wouldn&#39;t get to hung up on this right now, as =
it would be simple enough to commit changes to lock files, etc, with genera=
ted long logs that contained all the information. That is outside of what t=
his series needs to consider.</div><br></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>
            <div style=3D"font-size:small">In my go
              recipes, I have a look at the dependency SRCREVS between
              updates. In particular if I&#39;m debugging a runtime issue,
              that helps me quickly see if a dependency changed and by
              how much it changed.=C2=A0</div>
            <div style=3D"font-size:small"><br>
            </div>
            <div style=3D"font-size:small">I could
              do the same with a drop-in lockfile that was in my recipe,
              since I&#39;d have the delta readily available and could see
              the source revisions, etc.=C2=A0</div>
            <div style=3D"font-size:small"><br>
            </div>
            <div style=3D"font-size:small">Of course
              if a drop-in file was used, we&#39;d want some sort of hash
              for the original file it was clobbering, since that
              indicates an update would be required (or dropping it,
              etc).</div>
          </div>
          <div><br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div> <br>
              <br>
              <blockquote type=3D"cite">
                <div dir=3D"ltr">
                  <div class=3D"gmail_quote">
                    <div style=3D"font-size:small">I feel the pain (and
                      your pain) of this after supporting complicated
                      go/mixed language recipes through multiple=C2=A0major
                      releases (and through go&#39;s changing dependency
                      model + bleeding edge code, etc) and needing to
                      track what has changed, so I definitely encourage
                      you to keep working on this.</div>
                    <div style=3D"font-size:small"><br>
                    </div>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                      <div>
                        <p> </p>
                        <p>As a compromise we could add a new feature to
                          generate .inc cache files before the main
                          bitbake run. This would eliminate the manual
                          update run and the commit noise as well as
                          special fetch, unpack and patch task.<br>
                          <br>
                        </p>
                      </div>
                    </blockquote>
                    <div style=3D"font-size:small">Can you elaborate on
                      what you mean by before the main bitbake run ?
                      Would it be still under a single bitbake
                      invokation or would it be multiple runs (I support
                      multiple runs, so don&#39;t take that as a leading
                      question).<br>
                    </div>
                  </div>
                </div>
              </blockquote>
              <p>I can&#39;t answer this questions and need Richard guidanc=
e
                to implement such a feature. I would assume that bitbake
                already track file changes and can update its state. The
                behavior should be similar to a change in the .inc file.
                Bitbake will detect that a &quot;include_cache&quot; file i=
s
                missing and run an update_cache task on the recipe.
                Afterwards bitbake detect a file change on the
                &quot;include_cache&quot; file and parse it. We need a poss=
ibility
                to mark patches which shouldn&#39;t be applied if the
                &quot;include_cache&quot; file is missing because the depen=
dencies
                are missing. We need to run the fetch, unpack and patch
                task before the update_cache task to generate the .inc
                file.</p>
            </div>
          </blockquote>
        </div>
        <div>
          <div style=3D"font-size:small">Aha. Maybe
            Richard will comment later. I was thinking more about
            something that was in two distinct phases, but with some
            more thinking and explanation, maybe this is workable as
            well.<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>This is only needed if we need the dynamic SRC_URIs outside of
      bitbake in the common bitbake format (SRC_URI +=3D &quot;...&quot;). =
Otherwise
      we could save the information inside the WORKDIR and depend on the
      sstate cache.<br></p></div></blockquote><div><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">I think we are describing differen=
t things again. I&#39;m just looking for the ability to run some of the tas=
ks separately and do it in two distinct steps. So that wouldn&#39;t involve=
 WORKDIR or sstate, but would just generate the lock or .inc file, or whate=
ver. And then have the build use that file later.</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Bruce</div></div></div>

--000000000000b4382a062e0918ae--

