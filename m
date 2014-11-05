Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 641EB6017E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 10:12:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Nov 2014 02:12:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,319,1413270000"; d="scan'208";a="626879192"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.104.113])
	by fmsmga002.fm.intel.com with ESMTP; 05 Nov 2014 02:12:20 -0800
Date: Wed, 5 Nov 2014 12:12:19 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Wilder <friendwilder@yahoo.com.mx>
Message-ID: <20141105101219.GE5826@lpalcu-linux>
References: <1413997468.482573.1415127724792.JavaMail.yahoo@jws10030.mail.ne1.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <1413997468.482573.1415127724792.JavaMail.yahoo@jws10030.mail.ne1.yahoo.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: struct.error: unpack requires a string argument of length 32 in Yocto
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
X-List-Received-Date: Wed, 05 Nov 2014 10:12:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wilder,

On Tue, Nov 04, 2014 at 07:02:04PM +0000, Wilder wrote:
> Hi Laurentiu
> 
> 
> I am a student from Mexico, and we are using Yocto to build our images, however there is a unique error that is bothering me while
> trying to set up the environment to build an image with sdk, I am not so familiar with structs using python and this is the error I
> get:
> 
> 
> Traceback (most recent call last):
> 
>   File "/media/wilder/Seagate_Backup_Plus_Drive/ITESM/MSE/te5009/opt/poky/1.6.1/relocate_sdk.py", line 231, in <module>
> 
>     change_interpreter(e)
> 
>   File "/media/wilder/Seagate_Backup_Plus_Drive/ITESM/MSE/te5009/opt/poky/1.6.1/relocate_sdk.py", line 89, in change_interpreter
> 
>     p_memsz, p_flags, p_align = struct.unpack(ph_fmt, ph_hdr)
> 
> struct.error: unpack requires a string argument of length 32
> 
> 
> I am using a Chromebook with Ubuntu 14 installed on it and it seems that this error is not showing up in other computers from my
> classmates, 
> 
> 
> At the beginning I thought the issue was because of the python version, since by default it uses Python 3, but now I have python
> 2.7.6 and the same error message is shown.
It's hard to tell what the real issue is. But, you'd get this kind of
error if the binary being relocated is corrupt. The script reads the ELF
header first and then goes through the program header table to find the
INTERP section. Apparently, in your case, the size of e_phentsize (which
is taken from the ELF header) is different from the actual size of one
program header entry for a 32bit binary.

But, you could easily find out which is the problematic binary:
1. Run the SDK installer with -S -R
2. go to the install directory and change the relocate_sdk.py to print
the name of the binary being relocated
3. execute ./relocate_sdk.sh

After you find the binary, use readelf to inspect it.

> 
> 
> Could you please point me to a forum where I can ask for help_
You can always find help on the OE-core mailing list:
openembedded-core@lists.openembedded.org (CCed)

You can subscribe here:
http://lists.openembedded.org/mailman/listinfo/openembedded-core

laurentiu
> 
> 
> Thanks in advance,
> 
> Wilder
> 
> 
> 

