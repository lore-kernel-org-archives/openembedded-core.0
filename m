Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web11.13335.1628189408320455451
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 11:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 175InI8I011039
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Thu, 5 Aug 2021 13:49:19 -0500
Subject: Re: [OE-core] should recipes not come with their own systemd/user/group info?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
        OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <d9126d7b-13ed-6a37-1db8-2affecbca83@crashcourse.ca>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <9fdde0d8-5e5a-40eb-e9ef-aa56d3d06394@kernel.crashing.org>
Date: Thu, 5 Aug 2021 13:49:17 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <d9126d7b-13ed-6a37-1db8-2affecbca83@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/5/21 6:01 AM, Robert P. J. Day wrote:
> 
>   style question here, but i'm perusing an OE/YP (actually wind river,
> but effectively the same thing) layer that was handed to me, and i'm
> puzzled by how the internally-written systemd-controlled services are
> implemented.
> 
>   on the one hand, there are reasonable recipes that each represent
> some service to be managed by systemd, and they all install their
> executables in the right places and so on. however, rather than each
> recipe also providing its own service file, there is a totally
> separate recipe (call it "systemd-services.bb") which contains under
> its files/ directory dozens and dozens of service files for all of
> those recipes, and is responsible for installing all of them.
> 
>   in short, someone decided that -- for whatever reason -- all of the
> systemd service files should be collected all in one place, and
> installed en masse. is this ... normal? i would have thought that it's
> the responsibility of each recipe to mannage all the content related
> to it, and that would of course include the systemd service file to be
> installed for it. i don't know the rationale for this, and it strikes
> me as a recipe for disaster in trying to keep all these things synced
> up. is there some rationale for doing it this way that i'm unaware
> of?

For a 'product' (as in, this is only for one implementation and nobody will ever
re-use it), I've see this type of thing before.  But for anything intended to be
re-used, it's simply broken.

The service files belong with the recipes providing the services.

>   and closely related, the same trick was used when defining all the
> new users and groups that would own these services. rather than each
> service looking after itself, there is a recipe file (call it
> "new_users_and_groups.bb") which is hundreds of lines of USERADD_PARAM
> and GROUPADD_PARAM lines that define precisely (numerically) all the
> new user and group accounts to be associated with all sorts of
> services, whereupon i ask the same question -- isn't it more typical
> that each service look after its own user and group info?

The same is true here, if you are creating a singular product that has a number
of defined users and groups, sure you can do it in a recipe like this.  But it's
not the right way to do it.  Users/groups should be associated with their users.
 If these are just general administrative usages then they COULD be done this
way, but more people do it at image generation time.

>   in this second case, it *might* be that all of these values need to
> be hard-coded to be consistent with, i don't know, something else i'm
> unaware of, but it still looks strange.

If you need to 'adjust' users and groups, you should be using the existing
mechanisms, useradd-staticids for instance.

--Mark

>   thoughts? the above actually works for the time being, but it does
> seem a but unnatural.
> 
> rday
> 
> 
> 
> 
> 
