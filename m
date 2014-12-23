Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE6AC726C0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 01:57:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBN1uxiR008867
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 17:57:00 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 22 Dec 2014 17:56:59 -0800
Message-ID: <5498CBEA.1040708@windriver.com>
Date: Tue, 23 Dec 2014 09:56:58 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1418969925.git.Qi.Chen@windriver.com>	<084ad3c5c70057e5f8f06bf85b4543a590a17a54.1418969925.git.Qi.Chen@windriver.com>
	<5493C8D0.1040907@topic.nl>
In-Reply-To: <5493C8D0.1040907@topic.nl>
X-Originating-IP: [128.224.162.226]
Subject: Re: [PATCH 1/4] packaging: allow globs in CONFFILES
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
X-List-Received-Date: Tue, 23 Dec 2014 01:57:07 -0000
Content-Type: multipart/alternative;
	boundary="------------080807000502060204030702"

--------------080807000502060204030702
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/2014 02:42 PM, Mike Looijmans wrote:
> On 12/19/2014 07:21 AM, Chen Qi wrote:
> > ...
>> As almost all files under /etc are basically configuration files, we
>> provide a default value for CONFFILES.
>>
>>      CONNFFILES = "${sysconfdir}"
>
> This is going to hurt a lot of recipes. Please do not set this.
>
> The default has always been that CONFFILES is empty. I see no reason 
> whatsoever to suddenly change this.
>
>> In this way, we don't need to modify every recipe to set the CONFFILES
>> variable. Of course, setting CONFFILES in recipes take precedence over
>> the CONFFILES. For example, if the recipe author decides that package A
>> should only treat files under ${sysconfdir}/default/ as config files,
>> he/she can write like this.
>>
>>      CONFFILES_A = "${sysconfdir}/default"
>>
>> The above situation should not be common. As according to FHS, the /etc
>> directory is a place for all system related configuration files.
>
> FHS may have written that somewhere, but if you just take a quick look 
> at what is in /etc/, you'll find that actual configuration files are 
> quite rare, but there are tons of scripts and distro related files 
> there. Whether or not a file there is supposed to be edited by the 
> end-user is something of a distro decision.
>
> Also, "configuration file" does not necessarily mean that the USER is 
> in control. A configuration file may also simply distinguish machine 
> capabilities or software features.
>
> We'll end up having to patch hundreds of recipes with a CONFFILES="" 
> or similar line.
>

Hi Mike,

Sorry for the late reply. I was involved in other work these days.
Please see my explanation below.

Most files under /etc are configuration files. If we don't default 
CONFFILES to ${sysconfdir}, then we have to patch a lot of recipes with 
CONFFILES_xxx = "xxxx" lines.

The fact is that when people write recipes, they often forget about 
CONFFILES.
The typical example is the shadow recipe. And I can easily give you more 
examples.

And it's not uncommon that people forget to check CONFFILES when they 
update the recipe.
When the recipe is updated to a new version, it's possible that the 
CONFFILES should change.
The typical example is the systemd recipe.

*The bad effect of the above? On-target package upgrades override user 
changes. That's a really annoying problem, isn't it?*
Users of OE based projects have complained about this. There were 
patches on OE which fixed several recipes. But the solution doesn't scale.

The patchset is an effort to change this situation.

Best Regards,
Chen Qi

>
> Met vriendelijke groet / kind regards,
>
> Mike Looijmans
> System Expert
>
>
> TOPIC Embedded Systems
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: (+31) (0) 499 33 69 79
> Telefax:  (+31) (0) 499 33 69 70
> E-mail: mike.looijmans@topic.nl
> Website: www.topic.nl
>
> Please consider the environment before printing this e-mail
>
> Topic zoekt gedreven (embedded) software specialisten!
> http://topic.nl/vacatures/topic-zoekt-software-engineers/
>


--------------080807000502060204030702
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 12/19/2014 02:42 PM, Mike Looijmans
      wrote:<br>
    </div>
    <blockquote cite="mid:5493C8D0.1040907@topic.nl" type="cite">On
      12/19/2014 07:21 AM, Chen Qi wrote:
      <br>
      &gt; ...
      <br>
      <blockquote type="cite">As almost all files under /etc are
        basically configuration files, we
        <br>
        provide a default value for CONFFILES.
        <br>
        <br>
             CONNFFILES = "${sysconfdir}"
        <br>
      </blockquote>
      <br>
      This is going to hurt a lot of recipes. Please do not set this.
      <br>
      <br>
      The default has always been that CONFFILES is empty. I see no
      reason whatsoever to suddenly change this.
      <br>
      <br>
      <blockquote type="cite">In this way, we don't need to modify every
        recipe to set the CONFFILES
        <br>
        variable. Of course, setting CONFFILES in recipes take
        precedence over
        <br>
        the CONFFILES. For example, if the recipe author decides that
        package A
        <br>
        should only treat files under ${sysconfdir}/default/ as config
        files,
        <br>
        he/she can write like this.
        <br>
        <br>
             CONFFILES_A = "${sysconfdir}/default"
        <br>
        <br>
        The above situation should not be common. As according to FHS,
        the /etc
        <br>
        directory is a place for all system related configuration files.
        <br>
      </blockquote>
      <br>
      FHS may have written that somewhere, but if you just take a quick
      look at what is in /etc/, you'll find that actual configuration
      files are quite rare, but there are tons of scripts and distro
      related files there. Whether or not a file there is supposed to be
      edited by the end-user is something of a distro decision.
      <br>
      <br>
      Also, "configuration file" does not necessarily mean that the USER
      is in control. A configuration file may also simply distinguish
      machine capabilities or software features.
      <br>
      <br>
      We'll end up having to patch hundreds of recipes with a
      CONFFILES="" or similar line.
      <br>
      <br>
    </blockquote>
    <br>
    Hi Mike,<br>
    <br>
    Sorry for the late reply. I was involved in other work these days.<br>
    Please see my explanation below.<br>
    <br>
    Most files under /etc are configuration files. If we don't default
    CONFFILES to ${sysconfdir}, then we have to patch a lot of recipes
    with CONFFILES_xxx = "xxxx" lines.<br>
    <br>
    The fact is that when people write recipes, they often forget about
    CONFFILES.<br>
    The typical example is the shadow recipe. And I can easily give you
    more examples.<br>
    <br>
    And it's not uncommon that people forget to check CONFFILES when
    they update the recipe.<br>
    When the recipe is updated to a new version, it's possible that the
    CONFFILES should change.<br>
    The typical example is the systemd recipe.<br>
    <br>
    <b>The bad effect of the above? On-target package upgrades override
      user changes. That's a really annoying problem, isn't it?</b> <br>
    Users of OE based projects have complained about this. There were
    patches on OE which fixed several recipes. But the solution doesn't
    scale.<br>
    <br>
    The patchset is an effort to change this situation.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote cite="mid:5493C8D0.1040907@topic.nl" type="cite">
      <br>
      Met vriendelijke groet / kind regards,
      <br>
      <br>
      Mike Looijmans
      <br>
      System Expert
      <br>
      <br>
      <br>
      TOPIC Embedded Systems
      <br>
      Eindhovenseweg 32-C, NL-5683 KH Best
      <br>
      Postbus 440, NL-5680 AK Best
      <br>
      Telefoon: (+31) (0) 499 33 69 79
      <br>
      Telefax:  (+31) (0) 499 33 69 70
      <br>
      E-mail: <a class="moz-txt-link-abbreviated" href="mailto:mike.looijmans@topic.nl">mike.looijmans@topic.nl</a>
      <br>
      Website: <a class="moz-txt-link-abbreviated" href="http://www.topic.nl">www.topic.nl</a>
      <br>
      <br>
      Please consider the environment before printing this e-mail
      <br>
      <br>
      Topic zoekt gedreven (embedded) software specialisten!
      <br>
      <a class="moz-txt-link-freetext" href="http://topic.nl/vacatures/topic-zoekt-software-engineers/">http://topic.nl/vacatures/topic-zoekt-software-engineers/</a>
      <br>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------080807000502060204030702--
