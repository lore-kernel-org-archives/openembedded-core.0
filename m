Return-Path: <janne.karhunen@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD36723B3
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 20:31:29 +0000 (UTC)
Received: by pdbni2 with SMTP id ni2so39493374pdb.1
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 13:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zlVO8ZjNrfiVPvgOWlXLdoBnhj0C3L5KrWMVACnuL5I=;
	b=XdewEq5MhXDclig9ZCIsOtlcSFVxRgIDMbGLZ13FgY75bRAZQ7VPmWNKvb55jnkHDR
	kzqGYijqQ1vQoZqnmK7m6xfeePy6+6xblAfOijx3II+s04q6dvmzO8iEfFFW8TSUL4TH
	m9vGGZ9vUYn5f1DTgKog1GrT3lFDB9Ub1bf7uCUKhnTE212qV2L6EwxKXJSPv7wtBIt5
	qM5A0hVHnRJkH8y1ouZFZxHxi1lQGHJJRDvYgipvsu6UaakQUpVSqVtsJFOXwYPjHG2U
	cc9QploYiW3K7GcfMccodF/FPAWtv6HdKZTTb9YW5tu2Yw3B+9jmOIPveGkoRZ9Z0zLu
	1TsA==
MIME-Version: 1.0
X-Received: by 10.66.140.39 with SMTP id rd7mr20067389pab.25.1427315491171;
	Wed, 25 Mar 2015 13:31:31 -0700 (PDT)
Received: by 10.70.103.39 with HTTP; Wed, 25 Mar 2015 13:31:31 -0700 (PDT)
In-Reply-To: <20150325183052.GL3904@jama>
References: <CAE=NcrZ-ODzj8LYcrGO0-a0Wvzb3YcyAqS44-NOwMumU9NVuAw@mail.gmail.com>
	<20150325183052.GL3904@jama>
Date: Wed, 25 Mar 2015 13:31:31 -0700
Message-ID: <CAE=NcraiB0OH+4EPF=t7_P3B3p_rjbU97-F8MtnROg-48OeumA@mail.gmail.com>
From: Janne Karhunen <janne.karhunen@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: pam related dependency processing bug?
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
X-List-Received-Date: Wed, 25 Mar 2015 20:31:31 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Thanks, inherited that file and missed that - and my RPM legacy was
thinking that's about right.

How do you guys test people don't leak dependencies with global
DEPENDS? Even this must have been passing by accident quite a while :)


--
Janne

On Wed, Mar 25, 2015 at 11:30 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Mar 25, 2015 at 10:39:34AM -0700, Janne Karhunen wrote:
>> Hi,
>>
>> Wonder if you guys can share some insights on how to debug this case.
>> I have a legacy PAM module recipe that says:
>>
>> DEPENDS_${PN} = "libpam"
>>
>> 'pam' is listed in DISTRO_FEATURES and is working fine. However, for
>> that pam module libpam dependency is silently dropped during the
>> build. If PAM happens to be compiled before that module, everything is
>> fine, but if not, build fails on missing pam headers.
>>
>> To make this interesting, 'bitbake -g -u depexp <module>' shows the
>> libpam dependency in place - yet it clearly is not there during the
>> build. Results are the same for both dizzy and daisy and host OS
>> doesn't seem to make a difference either.
>
> That's because
> DEPENDS_${PN}
> doesn't mean anything you should be using DEPENDS (only RDEPENDS,
> RPROVIDES, RREPLACES, RCONFLICTS variables are package specific and end
> with _<package-name> e.g. _${PN})
>
>>
>>
>> --
>> Janne
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

