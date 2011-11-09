Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROBJL-0006MT-4U
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 17:47:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Nov 2011 08:41:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,484,1315206000"; d="scan'208";a="72382721"
Received: from unknown (HELO [10.255.12.14]) ([10.255.12.14])
	by azsmga001.ch.intel.com with ESMTP; 09 Nov 2011 08:41:21 -0800
Message-ID: <4EBAAD31.7040603@linux.intel.com>
Date: Wed, 09 Nov 2011 08:41:21 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20111109130424.GB31478@deadlock.dhs.org>
In-Reply-To: <20111109130424.GB31478@deadlock.dhs.org>
Subject: Re: invalid recipe or a bug in bitbake?
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
X-List-Received-Date: Wed, 09 Nov 2011 16:47:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2011 05:04 AM, Sergey 'Jin' Bostandzhyan wrote:
> Hi,
>
> I was trying to buld a simple native-only recipe and ran into a strange
> problem that can be triggered using theattached test recipe.
>
> The actual problem is that do_populate_sysroot fails, although I do not
> do anything in regard to that in my recipe, I only have a custom do_install.
>
> I do not see what I could be doing wrong in the recipe itself, it looks valid
> to me... but it always triggers the error where tar is getting wrong directories
> as parameters.
>
> I did look into sysroot_stage_dirs() in staging.bbclass, it's basically
> doing things like:
>      sysroot_stage_dir $from${includedir} $to${includedir}
>
> My $from and $to seem to be correct, but the appended dirs seem to be wrong.
> I did echo ${includedir} and ${includedir_native} in my do_install() in the
> recipe, and it looked OK there...
>
I understand you solved your problem, but I have a follow-up 
question/comment for you.

Based on your solution, it would be interesting to see the output of 
bitbake -e native-test both before and after your change to to adding 
the "/" and also the BBCLASSEXTEND change.

I do not think that the BBCLASSEXTEND change is correct, since you do 
really only want a native built not a target and native.

You should just be using ${includedir} directly in your do_install() 
since the native.bbclass fixes the ${exec_prefix} which ${includedir} uses.

Give that a try and you can use bitbake -e to check the variables.

Sau!



> I did build quite a few packages in this setup already, so it seems that my
> overall configuration is OK (setup is based angstrom 2010).
>
> I am using OE core with bitbake:
> BitBake Build Tool Core version 1.13.3, bitbake version 1.13.3
>
> Any ideas?
>
> Kind regards,
> Jin
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


