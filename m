Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SSK0H-00014A-SU
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 05:25:22 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga14.intel.com with ESMTP/TLS/RC4-MD5; 09 May 2012 20:15:26 -0700
Received: by pbbro8 with SMTP id ro8so4502482pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 20:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=f6LdISCVDOS5e/c0RjBSYsNUPlin1rf2IWqdh1BVvow=;
	b=V9YOxv63ojoWXVCpvcfHGcSG/Cz03JAQTqBhf+/9ULtAocPUsAZy3WBlsJsJsOLXmB
	IBYdAyxlo5+EKKZmqmbAjSHe0a/D5BJpHPOr6u29upRod/FVGdmNH1haHkX8PJ4faq/k
	tC+jUN52vPM4A9il+N8d4inps+7IF5Low0bToD7LO6tnGOvAMKcr8M/ZWQPp6/33DT6w
	dBOvZ3hP4mSoeyMGalz/uYy4JtaK24bL4Q7rLpqfzZ01i8LBorLcYHjW96BTMLKNwMzO
	zyL/QxDV+5VlVrV1lVlgvcnDTVVwVZ2t2/1TcRFZWXyaBMDTmco3rqsf3y0FTrA78LxK
	OpvQ==
Received: by 10.68.203.225 with SMTP id kt1mr15731764pbc.133.1336619726271;
	Wed, 09 May 2012 20:15:26 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id pl7sm8052615pbb.59.2012.05.09.20.15.24
	(version=SSLv3 cipher=OTHER); Wed, 09 May 2012 20:15:25 -0700 (PDT)
Message-ID: <4FAB32CE.7090008@intel.com>
Date: Wed, 09 May 2012 20:15:26 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Jason Wessel <jason.wessel@windriver.com>
References: <4FA9C638.2000502@intel.com> <4FA9C827.3050304@windriver.com>
In-Reply-To: <4FA9C827.3050304@windriver.com>
X-Gm-Message-State: ALoCoQkTN9u2NMa2HPpeoI+WnYKroVsHe/k9/a8IXO6XmkYnH8KSa51x2wjarLFYL2/z5V2rfL8k
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Who wants/cares about SLiRP networking for QEMU?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2012 03:25:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2012 06:28 PM, Jason Wessel wrote:
> On 05/08/2012 08:19 PM, Scott Garman wrote:
>> This is an inquiry to see if there's much interest in adding an
>> alternate networking capability for our QEMU setups. Currently, we
>> use tun/tap devices, which need root privileges to be created.
>> Hence, our runqemu script requires sudo access.
>>
>> I'm curious to know who would like to see us use an alternate
>> mechanism (most likely SLiRP) to get around the need for sudo
>> access. Is this much of a problem for anyone, or would the team's
>> resources be better spent on other bugfixes?
>>
>> Secondly, does anyone have any war stories about using SLiRP for
>> this purpose? Is there a better way we should consider doing this?
>
> We have QEMU + UserMode NFS + SLiRP for years in Wind River Linux
> products.   In that period I have sent upstream most of the patches
> dealing with problems.  There remain a few patches to the User Mode
> NFS service which are not currently in the Yocto project.  I also
> have a patch that is not in the QEMU mainline that deals with syn
> packets where QEMU violates the RFC that was never merged upstream
> for some reason.  I imagine that you will probably want all those
> patches if that is going to be your mode of operation.
>
> You will also want to create a mechanism to easily add port
> redirections.  Typically we have always used what we call an
> simulator "instance" number so we know the ports are at generally
> fixed locations and for each instance number all the port
> redirections are incremented by 100.

Thanks Jason, this is exactly the kind of info I was hoping to learn 
about. It's possible/likely that I may not end up implementing this 
myself, but if the feature gets reassigned, I will make sure the 
implementor gets connected to you for those patches.

Thanks,

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


