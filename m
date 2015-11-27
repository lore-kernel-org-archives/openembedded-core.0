Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id C0BA060132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 17:15:44 +0000 (UTC)
Received: by oixx65 with SMTP id x65so64665957oix.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 09:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=qtZ3iIKlRtOaR+eIjUS6CT+gTRlbYbNKcyc3Kt/YD3c=;
	b=P/Mz/JEnI3to/wFHW/+7qju613aT5GUucwpSyQ1VyucsjDj6VpwZy7xYBfPW8rMeXi
	Y7e55WkPrWxYgIwwXjjQT5WC3PbW3NfGpl+oT/1SuyYsxkDGuVlLH7NEHpu8PeDv3GeX
	BU9azMkPNbJjRgh6JMNo2+wMWtNpo5SLqIPLkYAUmhXTcRzwnxUqTLGJJK+nq2toYyf3
	8h6rY5/YYtuJEOYcazYrBY5JN1N5Bx8lCg4AtI+r2clApm1uTY0DN4qx3pwg1UpcGUpK
	jMt5OX922y2R78Ve+2xvBgQUq3G8zuLU/fjRKEI33neSDoZ+AT1cy/qbVqdKxAFgvTPg
	6mfA==
X-Received: by 10.202.203.213 with SMTP id b204mr32378601oig.108.1448644544713;
	Fri, 27 Nov 2015 09:15:44 -0800 (PST)
Received: from [192.168.1.84] (75-163-220-91.clsp.qwest.net. [75.163.220.91])
	by smtp.googlemail.com with ESMTPSA id
	oj2sm15662823oeb.8.2015.11.27.09.15.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Nov 2015 09:15:43 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
From: akuster808 <akuster808@gmail.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56588FBB.3060907@gmail.com>
Date: Fri, 27 Nov 2015 09:15:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
Subject: Re: Patchwork & patch handling improvements
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
X-List-Received-Date: Fri, 27 Nov 2015 17:15:46 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


Paul,

On 11/26/2015 01:00 PM, Paul Eggleton wrote:
> Hi all,
> 

Thanks for taking the time to look into this.

> Over the past several years one of the regular complaints people have made 
> about our project has been that patches sometimes take a long time to make it 
> into master, and it's not always clear what the state of a patch is during 
> that time. On the other side of things, maintainers are finding it increasingly 
> hard to keep up with testing and integrating incoming patches.

This is not all the result of the patchwork. As a maintainer I rarely
use the patchwork in work flow as I have no access to the state change
bits. So its harder to integrate patchwork into my workflow.

Since the rules are to wait for changes to hit Master before moving them
down the line adds time to merging patches to the stable branches. The
Patchwork does not have an impact on that delay.

What adds to the challenge of integrating patches is that a layer
maintainer may shoot a patch directly into the stable branch so if I had
that patch queued, I now have to back it out.

Also, I do this work all on my free time so I do my work in batches with
leads to some delay. I could probably do a better job at communication
where things are in the process.

 Additionally,
> trivial mistakes sometimes creep in that would be fairly easy to catch with an 
> automated process. We've been talking about this for a while and now I'd like 
> to propose a plan to finally address this:
> 
> 1) Upgrade the OE Patchwork instance [0] to a newer release; this should fix 
> some of the problems we are having [1] plus give us additional features. I 
> propose using the fork that freedesktop.org are using [2] [3] which is moving 
> a bit faster than upstream Patchwork; whilst the changes there may eventually 
> make it upstream (and work is ongoing there) we have a much greater ability to 
> influence the fork given that it's being worked on by one of my colleagues who 
> is pushing it in the direction we need it to go e.g. proper support for series 
> as opposed to treating every patch individually, improved UI, etc.

Yes please.

> 
> 2) Trigger automatic testing of submitted patches from Patchwork. We'd have a 
> script look at the contents of a patch and first check that the expected style 
> has been adhered to; second it would do some quick tests to verify that the 
> patch hasn't caused any immediately obvious regressions. I've filed some bugs 
> to cover this in more detail [4].

sounds good.
> 
> 3) Provide a means to easily schedule an overnight build on the autobuilder 
> for the set of patches that have passed the initial testing, as well as 
> present the results in a form that's easier to review for maintainers. For OE-
> Core this would be tied into the Yocto Project autobuilder, but I expect the 
> tools could be made flexible.
> 
> At all stages through this process the patch status in patchwork will be kept 
> up-to-date so it's clear to everyone what's happening. I'm also thinking we 
> could do email notifications to the submitter (opt-in) though that would be a 
> later add-on.
> 
> Whilst the initial plan covers only OE-Core, once we get them working the 
> tools and scripts used should be just as applicable to other layers. I'm also 
> trying to ensure that the patch validation is generic enough so it can live in 
> OE-Core, and thus we can easily update and refine it over time in line with the 
> code itself as well as encourage submitters to use the script on their own 
> changes before sending.

Yes, I would like to use this with meta-oe
> 
> Please let me know your thoughts on the above, most importantly on the 
> patchwork upgrade, since most of this hinges on that; I don't believe we can 
> practically base it on the version of Patchwork we are using now. 
> 

Yes we should enhance any tools that improve our workflow and quality of
work.

Kind regards and thanks again Paul.
armin
> [Note that this email is cross-posted - it may be best to reply on OE-Core 
> only to save people's inboxes.]
> 
> Thanks,
> Paul
> 
> [0] http://patchwork.openembedded.org/
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=7657#c21
> [2] http://patchwork.freedesktop.org/ 
> [3] https://github.com/dlespiau/patchwork
> [4] https://bugzilla.yoctoproject.org/show_bug.cgi?id=8648
> 

