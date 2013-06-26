Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 40ED76AE2D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 22:16:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5QMGixQ024902
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Jun 2013 15:16:44 -0700 (PDT)
Received: from [128.224.147.234] (128.224.147.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 26 Jun 2013 15:16:44 -0700
Message-ID: <51CB6846.5020202@windriver.com>
Date: Wed, 26 Jun 2013 18:16:38 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Luo Zhenhua-B19537 <B19537@freescale.com>
References: <1371560890-26412-1-git-send-email-zhenhua.luo@freescale.com>
	<1371560653.20823.113.camel@ted>
	<CA452391058F6D4E9715FB2C29D9312A015BA748@039-SN2MPN1-022.039d.mgd.msft.net>
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A015BA748@039-SN2MPN1-022.039d.mgd.msft.net>
X-Originating-IP: [128.224.147.234]
Cc: Yu Zongchun-B40527 <B40527@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [patch v2] sanity.bbclass: correct the gcc_arch check logic
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
X-List-Received-Date: Wed, 26 Jun 2013 22:16:48 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 13-06-19 11:28 PM, Luo Zhenhua-B19537 wrote:
> Ping.
>
>> -----Original Message-----
>> From: Luo Zhenhua-B19537
>> Sent: Tuesday, June 18, 2013 9:26 PM
>> To: 'Richard Purdie'; Randy MacLeod
>> Cc: openembedded-core@lists.openembedded.org; Yu Zongchun-B40527
>> Subject: RE: [OE-core] [oe-core][patch v2] sanity.bbclass: correct the
>> gcc_arch check logic
>>
>> Hi Randy,
>>
>> During the test on my machine with gcc-4.1.2, if -march=native is not
>> supported by host gcc, a non-zero value(256) returns, otherwise 0 returns.
>>
>> [LOG]
>> status is 256
>> result is gcc_test.c:1: error: bad value (native) for -march= switch
>> gcc_test.c:1: error: bad value (native) for -mtune= switch
>>
>> Please confirm if this is same as your result.

Yes it's essentially the same.

Mark decided that the previous test program that
checked for the existence of:
    __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
would be better done as a check for:
    __sync_bool_compare_and_swap
I believe he got the idea from looking at glib's configure script.

I'm working on properly checking on which value to give to march:
native,i686,x86-64. More tomorrow.

// Randy

Test results and prelim code if you are interested.


Here's how that test behaves with the old toolchain:

### What's the host setup?

$ gcc --version
gcc (GCC) 4.1.2 20080704 (Red Hat 4.1.2-54)
Copyright (C) 2006 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

$ head -1 /etc/issue
CentOS release 5.9 (Final)


### Old test and results: All options fail, returning a status of 1.

$ gcc  -o /tmp/jj /tmp/gcc-jj.c
/tmp/gcc-jj.c: In function ‘main’:
/tmp/gcc-jj.c:1: error: ‘__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4’ undeclared 
(first use in this function)
/tmp/gcc-jj.c:1: error: (Each undeclared identifier is reported only once
/tmp/gcc-jj.c:1: error: for each function it appears in.)

$ echo $?
1


$ gcc -march=native -o /tmp/jj /tmp/gcc-jj.c
/tmp/gcc-jj.c:1: error: bad value (native) for -march= switch
/tmp/gcc-jj.c:1: error: bad value (native) for -mtune= switch
$ echo $?
1

$ gcc -march=i686 -o /tmp/jj /tmp/gcc-jj.c
/tmp/gcc-jj.c: In function ‘main’:
/tmp/gcc-jj.c:1: error: ‘__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4’ undeclared 
(first use in this function)
/tmp/gcc-jj.c:1: error: (Each undeclared identifier is reported only once
/tmp/gcc-jj.c:1: error: for each function it appears in.)
$ echo $?
1




### New test and results: -march=`mangle uname -m` works.

$ cat /tmp/gcc_test.c
int main (){ volatile int atomic = 2; __sync_bool_compare_and_swap 
(&atomic, 2, 3); return 0;}


$ gcc -o /tmp/jj /tmp/gcc_test.c
/tmp/ccEVX7IX.o: In function `main':
gcc_test.c:(.text+0x2f): undefined reference to 
`__sync_bool_compare_and_swap_4'
collect2: ld returned 1 exit status
$ echo $?
1

$ gcc -march=native -o /tmp/jj /tmp/gcc_test.c
/tmp/gcc_test.c:1: error: bad value (native) for -march= switch
/tmp/gcc_test.c:1: error: bad value (native) for -mtune= switch
$ echo $?
1

$ uname -m
i686

$ gcc -march=i686 -o /tmp/jj /tmp/gcc_test.c
rmacleod@yow-lpggp1 .../wrs/b/snty  $ echo $?
0

So you see that -march=native isn't useful for gcc-4.1.2 but
-march=`munged uname -m` is.


I'm in the middle of writing a more complete test but
my lack of python development is showing:


-# Checks if necessary to add option march to host gcc
+# Checks if necessary to add march option to host gcc
  def check_gcc_march(sanity_data):
-    result = False
+    result = ""

      # Check if -march not in BUILD_CFLAGS
      if sanity_data.getVar("BUILD_CFLAGS",True).find("-march") < 0:
@@ -293,12 +293,22 @@ def check_gcc_march(sanity_data):
          # Check if GCC could work without march
          status,result = oe.utils.getstatusoutput("${BUILD_PREFIX}gcc 
gcc_test.c -o gcc_test")
          if status != 0:
-            # Check if GCC could work with march
+            # Check if GCC could work with march=native
              status,result = 
oe.utils.getstatusoutput("${BUILD_PREFIX}gcc -march=native gcc_test.c -o 
gcc_test")
-            if status != 0:
-                result = True
+            if status == 0:
+                result = "native"
              else:
-                result = False
+                # Check if GCC could work with march=i686
+                status,result = 
oe.utils.getstatusoutput("${BUILD_PREFIX}gcc -march=x86-64 gcc_test.c -o 
gcc_test")
+                if status == 0:
+                    result = "x86-64"
+                else:
+                    # Check if GCC could work with march=i686
+                    status,result = 
oe.utils.getstatusoutput("${BUILD_PREFIX}gcc -march=i686 gcc_test.c -o 
gcc_test")
+                    if status == 0:
+                        result = "i686"
+                    else:
+                        result = "none"


...

-    if check_gcc_march(d):
-        status.addresult("Your gcc version is older than 4.5, please 
add the following param to local.conf\n \
-        BUILD_CFLAGS_append = \" -march=native\"\n")
+    gcc_march_option = check_gcc_march(d)
+    if gcc_march_option != "":
+        if gcc_march_option == "none":
+            status.addresult("Your gcc version is too old.\n \
+        else:
+            status.addresult("Your gcc version is older than 4.5, 
please add the following param to local.conf\n \
+                   BUILD_CFLAGS_append = \" -march=%s\"\n", 
gcc_march_option)



I'll clean this up to actually work and probably use
${BUILD_ARCH} instead of i686/x86-64.

More tomorrow.

// Randy

>>
>>
>> Best Regards,
>>
>> Zhenhua
>>
>>
>>> -----Original Message-----
>>> From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
>>> Sent: Tuesday, June 18, 2013 9:04 PM
>>> To: Luo Zhenhua-B19537; Randy MacLeod
>>> Cc: openembedded-core@lists.openembedded.org; Yu Zongchun-B40527
>>> Subject: Re: [OE-core] [oe-core][patch v2] sanity.bbclass: correct the
>>> gcc_arch check logic
>>>
>>> On Tue, 2013-06-18 at 21:08 +0800, Zhenhua Luo wrote:
>>>> The gcc arch check result is incorrect when gcc version is older
>>>> than
>>> 4.5.
>>>> Sanity checker requests user to add "-march=native" into
>>>> BUILD_CFLAGS even if the flag is not supported by host gcc.
>>>>
>>>> The status is 0 when -march=native is supported by host gcc, so set
>>>> result to True, otherwise set result to False.
>>>>
>>>> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
>>>> ---
>>>>   meta/classes/sanity.bbclass |    2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/classes/sanity.bbclass
>>>> b/meta/classes/sanity.bbclass index 3b9934b..ee09679 100644
>>>> --- a/meta/classes/sanity.bbclass
>>>> +++ b/meta/classes/sanity.bbclass
>>>> @@ -325,7 +325,7 @@ def check_gcc_march(sanity_data):
>>>>           if status != 0:
>>>>               # Check if GCC could work with march
>>>>               status,result =
>>> oe.utils.getstatusoutput("${BUILD_PREFIX}gcc -march=native gcc_test.c
>>> -o
>>> gcc_test")
>>>> -            if status != 0:
>>>> +            if status == 0:
>>>>                   result = True
>>>>               else:
>>>>                   result = False
>>>
>>> Can you and Randy please sort out what the correct value is here please.
>>> This appears to directly revert
>>> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=ad276d7d89190c57a
>>> 152
>>> 867d7278ee18f784ff2c
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

