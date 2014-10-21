Return-Path: <paul.betafive@gmail.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id D502465CDB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 16:18:05 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id dc16so1067370qab.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 09:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=hbW5d9dUphqs4Pu9WI6VUMRBNblRNjgbYH88u7qIEE8=;
	b=BRpXbiXqabm72Drug/ghOFHFo6SQ+bjcR8wS85M2vacuAhMwOpqB6qVYOteoQnaoD6
	BGbQSsxD6i8sAt73Gp/HzgDtxV7d0VqSzgTwuxTnRSHSiEYQ34g3z0X/Ao+lZbUh9JqD
	ml7Q7k8VwHKX2RebzNUTV4owlUDMGKpF+Z0IXce6MGrYWW+aPOVWzq0IFFE3RB6dcQvK
	JJ3KeM8s++zbC0QQVnFSg/s/jS7F9cFxkzZY89BI7PBroNfOr9hQwYtpRB3+z7AHwRZO
	EXt36pcokBTLsKkG079Nc59jw3it0neaLV/n9LdYW3lmE3mekdK1kD6LpWKKbC/edrJR
	M3Yw==
X-Received: by 10.224.46.202 with SMTP id k10mr46231875qaf.36.1413908281737;
	Tue, 21 Oct 2014 09:18:01 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Tue, 21 Oct 2014 09:17:20 -0700 (PDT)
In-Reply-To: <CANyK_8e2DGuhNL2Cmo4MvrBFWR1_obXHqANJK6pEyixt9NycSw@mail.gmail.com>
References: <cover.1412770325.git.hongxu.jia@windriver.com>
	<241e2535b1e3f4544e31fdc40406337b26e8f8d9.1412770325.git.hongxu.jia@windriver.com>
	<CANyK_8eqiktne2E4EwpWoBpz_-xtDweSS56XdBi6ocKoh_Wq2A@mail.gmail.com>
	<543903BC.6020706@windriver.com>
	<CANyK_8fkQmOD8=gCkUBG3BSYhF9PCvn2-CYka2Xnk=XBBgWD7w@mail.gmail.com>
	<54390771.1040402@windriver.com>
	<CANyK_8e2DGuhNL2Cmo4MvrBFWR1_obXHqANJK6pEyixt9NycSw@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 21 Oct 2014 17:17:20 +0100
X-Google-Sender-Auth: c760-EJxrA0xAicxIh8n_9yIJBs
Message-ID: <CANyK_8eZPVPZ76vE6h1GBw1w-eOrFYKzLOK3LQ78R9wAgV48PQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] opkg: fix remove pkg with --force-removal-of-dependent-packages failed
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
X-List-Received-Date: Tue, 21 Oct 2014 16:18:09 -0000
Content-Type: text/plain; charset=UTF-8

On 11 October 2014 11:37, Paul Barker <paul@paulbarker.me.uk> wrote:
> On 11 October 2014 11:33, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>>
>> Here is my patch, and it could not work, I think we are doing
>> the same thing:
>>
>> --- a/libopkg/opkg_remove.c
>> +++ b/libopkg/opkg_remove.c
>> @@ -118,8 +118,11 @@ opkg_remove_dependent_pkgs(pkg_t *pkg, abstract_pkg_t
>> **dependents)
>>              for (a = 0; a < dep_ab_pkg->pkgs->len; a++) {
>>                  pkg_t *dep_pkg = dep_ab_pkg->pkgs->pkgs[a];
>>                  if (dep_pkg->state_status == SS_INSTALLED) {
>> -                    pkg_vec_insert(dependent_pkgs, dep_pkg);
>> -                    count++;
>> +                    if (!pkg_vec_contains(dependent_pkgs, dep_pkg))
>> +                    {
>> +                        pkg_vec_insert(dependent_pkgs, dep_pkg);
>> +                        count++;
>> +                    }
>>
>> //Hongxu
>
> My assumption was that duplicates were only being added during a
> single call to opkg_remove_dependent_pkgs, as on subsequent calls a
> package will no longer have state_status == SS_INSTALLED if it has
> already been removed. If my assumption is wrong, your original patch
> looks to be the best solution.
>

Hongxu's original patch applies correctly upstream and passes the opkg
test suite. I'll merge this onto the opkg-0.2.x branch and so we can
change Upstream-status to 'Backport'.

Acked-by: Paul Barker <paul@paulbarker.me.uk>

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

