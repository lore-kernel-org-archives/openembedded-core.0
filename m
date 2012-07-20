Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SsCab-0003gT-Eh
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 14:45:49 +0200
Received: from localhost ([127.0.0.1]:59981 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SsCPa-0002uA-ES
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 12:34:26 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=vsQlUGkHMKCNbQJRwxLmD17CPqQ=; b=bAB27gCSzHNHSxof445IF3F/Mg/+
	x9T1QpwMf8ww8WAKnHZFOTCbnH7UE/RF3uhyu++Q6PwkwMPr1hOlXboLN5pTyB/e
	I4pvCS6NT88PjSMrFPM/Nxip8E4azj20hCokDFh3uzf8PIb8c3O+5PPjRh83x/3p
	LjZv5Ppe+mZ3stM=
Received: from [195.171.99.130] (port=48588 helo=[192.168.0.42])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SsCKk-0002lq-AZ
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 12:29:26 +0000
Message-ID: <50094F6B.5000108@communistcode.co.uk>
Date: Fri, 20 Jul 2012 13:30:35 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <50092AF0.9020403@communistcode.co.uk>
	<1342786758.21788.12.camel@ted>
In-Reply-To: <1342786758.21788.12.camel@ted>
Subject: Re: bison-native cleansstate failing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 20 Jul 2012 12:45:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/07/12 13:19, Richard Purdie wrote:
> On Fri, 2012-07-20 at 10:54 +0100, Jack Mitchell wrote:
>> I thought this was a python whitespace issue but it turns out not to be,
>> when I try to cleansstate bison-native I get the trace:
>>
>>      NOTE: Running task 1 of 2 (ID: 0,
>>      virtual:native:/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-devtools/bison/bison_2.5.bb,
>>      do_clean)
>>      NOTE: package bison-native-2.5-r2: task do_clean: Started
>>      ERROR: Error executing a python function in
>>      /mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-devtools/bison/bison_2.5.bb:
>>      OSError: [Errno 39] Directory not empty:
>>      '/mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/bison-native-2.5-r2/temp'
>>
>>      ERROR: The stack trace of python calls that resulted in this
>>      exception/failure was:
>>      ERROR:   File "do_clean", line 16, in <module>
>>      ERROR:
>>      ERROR:   File "do_clean", line 6, in do_clean
>>      ERROR:
>>      ERROR:   File
>>      "/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/lib/oe/path.py",
>>      line 94, in remove
>>      ERROR:     shutil.rmtree(name)
>>      ERROR:
>>      ERROR:   File "/usr/lib/python2.7/shutil.py", line 245, in rmtree
>>      ERROR:     rmtree(fullname, ignore_errors, onerror)
>>      ERROR:
>>      ERROR:   File "/usr/lib/python2.7/shutil.py", line 254, in rmtree
>>      ERROR:     onerror(os.rmdir, path, sys.exc_info())
>>      ERROR:
>>      ERROR:   File "/usr/lib/python2.7/shutil.py", line 252, in rmtree
>>      ERROR:     os.rmdir(path)
>>      ERROR:
>>      ERROR: The code that was being executed was:
>>      ERROR:      0012:    for f in (d.getVar('CLEANFUNCS', True) or
>>      '').split():
>>      ERROR:      0013:        bb.build.exec_func(f, d)
>>      ERROR:      0014:
>>      ERROR:      0015:
>>      ERROR:  *** 0016:do_clean(d)
>>      ERROR:      0017:
>>      ERROR: (file: 'do_clean', lineno: 16, function: <module>)
>>      ERROR:      0002:def do_clean(d):
>>      ERROR:      0003:    """clear the build and temp directories"""
>>      ERROR:      0004:    dir =
>>      d.expand("/mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/bison-native-2.5-r2")
>>      ERROR:      0005:    bb.note("Removing " + dir)
>>      ERROR:  *** 0006:    oe.path.remove(dir)
>>      ERROR:      0007:
>>      ERROR:      0008:    dir = "%s.*" % bb.data.expand(d.getVar('STAMP'), d)
>>      ERROR:      0009:    bb.note("Removing " + dir)
>>      ERROR:      0010:    oe.path.remove(dir)
>>      ERROR: (file: 'do_clean', lineno: 6, function: do_clean)
>>      ERROR: Function failed: do_clean
>>      NOTE: package bison-native-2.5-r2: task do_clean: Failed
>>      ERROR: Task 0
>>      (virtual:native:/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-devtools/bison/bison_2.5.bb,
>>      do_clean) failed with exit code '1'
>>      NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be
>>      rerun and 1 failed.
>>
>>
>> However when I check the bison-native temp directory:
>>
>>      [build@yoctoBuilder x86_64-linux]$ cd bison-native-2.5-r2/
>>      [build@yoctoBuilder bison-native-2.5-r2]$ ls
>>      temp
>>      [build@yoctoBuilder bison-native-2.5-r2]$ cd temp/
>>      [build@yoctoBuilder temp]$ ls -la
>>      total 8
>>      drwxr-sr-x 2 build storage 4096 Jul 20 10:50 .
>>      drwxr-sr-x 3 build storage 4096 Jul 20 10:50 ..
>>      [build@yoctoBuilder temp]$
>>
>> Any ideas?
> I think its a race since the task writes out logfiles into temp/ and the
> command tries to remove all the files. Locally here, it seems to manage
> to remove leaving the logfile. I'm puzzled why you see that and I don't
> though...
>
> Cheers,
>
> Richard
>

There are a couple of extra variables on my end that may be encouraging 
this.

    1) This is a virtual machine
    2) The build storage directory is hosted via nfs


Do you think it could be an nfs problem with delayed read/writes? It 
isn't over
a physical network, just a virtual one between the virtual machine and 
host so
network latency shouldn't be an issue.

Cheers,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



