Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SU40R-00052r-1w
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 00:44:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4EMYhej014675
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 15:34:43 -0700 (PDT)
Received: from msp-dhcp25.wrs.com (172.25.34.25) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 14 May 2012 15:34:42 -0700
Message-ID: <4FB18881.80702@windriver.com>
Date: Mon, 14 May 2012 17:34:41 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
	<4FA8611B.8060609@intel.com> <20120508020738.46574fa5@wrlaptop>
In-Reply-To: <20120508020738.46574fa5@wrlaptop>
Subject: Re: [PATCH 1/6] runqemu: Use OE_TMPDIR
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
X-List-Received-Date: Mon, 14 May 2012 22:44:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/12 2:07 AM, Peter Seebach wrote:
> On Mon, 7 May 2012 16:56:11 -0700
> Scott Garman<scott.a.garman@intel.com>  wrote:
>
>>    From what I can tell, the =~ regex operator is a bashism. It's also
>> one that helps a lot with the code readability. So now that we're
>> faced with re-writing the script to avoid using that operator, I'm
>> having second thoughts about whether the runqemu script really needs
>> to be shell-agnostic. The alternative of invoking grep or other
>> commands to process the name patterns does not appeal to me.
>>
>> I can understand why we're trying to ensure our build system doesn't
>> require /bin/sh to be bash, but I think support scripts like runqemu
>> might be a special case.
>>
>> What do other people in the community think of this? The runqemu
>> script isn't trivial, and it has to run in a lot of different
>> contexts. Should we put the time in to make it shell-agnostic, or
>> allow it to require bash?
>
> Hmm.  I am honestly not a big fan of the =~, simply because I almost
> never remember it, and I can never think whether it's like perl's ~=
> or Lua's ~=.  (One is "matches", the other is "is not".)

It's actually worse then =~ is a bashism, it's a specific version of bash.  I'm 
using bash as my shell, and it simply doesn't work my system.

The following works for me:

--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -300,14 +300,16 @@ findimage() {
      # recently created one is the one we most likely want to boot.
      filenames=`ls -t $where/*-image*$machine.$extension 2>/dev/null | xargs`
      for name in $filenames; do
-        if [ "$name" =~ core-image-sato-sdk -o \
-              "$name" =~ core-image-sato     -o \
-              "$name" =~ core-image-lsb      -o \
-              "$name" =~ core-image-basic    -o \
-              "$name" =~ core-image-minimal ]; then
+       case $name in
+          *core-image-sato-sdk* | \
+          *core-image-sato* | \
+          *core-image-lsb* | \
+          *core-image-basic* | \
+          *core-image-minimal*)
              ROOTFS=$name
              return
-        fi
+           ;;
+       esac
      done

      echo "Couldn't find a $machine rootfs image in $where."


> I tend to write stuff like this as
>
> case $name in
> *pat1* | *pat2* | ... )
>    # code goes here
>    ;;
> esac
>
> because that's the natural shell idiom.  It can't do full regex
> processing, but we really don't need that here; we just want an
> unanchored pattern match.  (And I'm not even sure we *want* a
> fully-unanchored match.)  I think the bash [[ ]] thing is one of the
> kshisms, but "bash or ksh" is not much better.  :P
>
>  From a maintenance standpoint, I like the case construct better
> than [[]].  My interest in reading the bash man page to figure out what
> some unfamiliar bit of punctuation means this week has declined over
> the years.

I agree, besides the =~ doesn't work at all of me..

[mhatle@msp-mhatle-lx2 build-ia32-4]$ bash --version
GNU bash, version 4.1.7(1)-release (x86_64-redhat-linux-gnu)
Copyright (C) 2009 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

that is on FC-13.  (ya, I know it's old.. but it's intentional we support older 
machines.)

--Mark

> -s



