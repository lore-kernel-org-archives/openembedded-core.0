Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SsCM6-000167-JQ for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 14:30:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KCJOdU012070;
	Fri, 20 Jul 2012 13:19:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09727-06; Fri, 20 Jul 2012 13:19:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KCJEno012064
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 20 Jul 2012 13:19:15 +0100
Message-ID: <1342786758.21788.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ml@communistcode.co.uk, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jul 2012 13:19:18 +0100
In-Reply-To: <50092AF0.9020403@communistcode.co.uk>
References: <50092AF0.9020403@communistcode.co.uk>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: bison-native cleansstate failing
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
X-List-Received-Date: Fri, 20 Jul 2012 12:30:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-20 at 10:54 +0100, Jack Mitchell wrote:
> I thought this was a python whitespace issue but it turns out not to be, 
> when I try to cleansstate bison-native I get the trace:
> 
>     NOTE: Running task 1 of 2 (ID: 0,
>     virtual:native:/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-devtools/bison/bison_2.5.bb,
>     do_clean)
>     NOTE: package bison-native-2.5-r2: task do_clean: Started
>     ERROR: Error executing a python function in
>     /mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-devtools/bison/bison_2.5.bb:
>     OSError: [Errno 39] Directory not empty:
>     '/mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/bison-native-2.5-r2/temp'
> 
>     ERROR: The stack trace of python calls that resulted in this
>     exception/failure was:
>     ERROR:   File "do_clean", line 16, in <module>
>     ERROR:
>     ERROR:   File "do_clean", line 6, in do_clean
>     ERROR:
>     ERROR:   File
>     "/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/lib/oe/path.py",
>     line 94, in remove
>     ERROR:     shutil.rmtree(name)
>     ERROR:
>     ERROR:   File "/usr/lib/python2.7/shutil.py", line 245, in rmtree
>     ERROR:     rmtree(fullname, ignore_errors, onerror)
>     ERROR:
>     ERROR:   File "/usr/lib/python2.7/shutil.py", line 254, in rmtree
>     ERROR:     onerror(os.rmdir, path, sys.exc_info())
>     ERROR:
>     ERROR:   File "/usr/lib/python2.7/shutil.py", line 252, in rmtree
>     ERROR:     os.rmdir(path)
>     ERROR:
>     ERROR: The code that was being executed was:
>     ERROR:      0012:    for f in (d.getVar('CLEANFUNCS', True) or
>     '').split():
>     ERROR:      0013:        bb.build.exec_func(f, d)
>     ERROR:      0014:
>     ERROR:      0015:
>     ERROR:  *** 0016:do_clean(d)
>     ERROR:      0017:
>     ERROR: (file: 'do_clean', lineno: 16, function: <module>)
>     ERROR:      0002:def do_clean(d):
>     ERROR:      0003:    """clear the build and temp directories"""
>     ERROR:      0004:    dir =
>     d.expand("/mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/bison-native-2.5-r2")
>     ERROR:      0005:    bb.note("Removing " + dir)
>     ERROR:  *** 0006:    oe.path.remove(dir)
>     ERROR:      0007:
>     ERROR:      0008:    dir = "%s.*" % bb.data.expand(d.getVar('STAMP'), d)
>     ERROR:      0009:    bb.note("Removing " + dir)
>     ERROR:      0010:    oe.path.remove(dir)
>     ERROR: (file: 'do_clean', lineno: 6, function: do_clean)
>     ERROR: Function failed: do_clean
>     NOTE: package bison-native-2.5-r2: task do_clean: Failed
>     ERROR: Task 0
>     (virtual:native:/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-devtools/bison/bison_2.5.bb,
>     do_clean) failed with exit code '1'
>     NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be
>     rerun and 1 failed.
> 
> 
> However when I check the bison-native temp directory:
> 
>     [build@yoctoBuilder x86_64-linux]$ cd bison-native-2.5-r2/
>     [build@yoctoBuilder bison-native-2.5-r2]$ ls
>     temp
>     [build@yoctoBuilder bison-native-2.5-r2]$ cd temp/
>     [build@yoctoBuilder temp]$ ls -la
>     total 8
>     drwxr-sr-x 2 build storage 4096 Jul 20 10:50 .
>     drwxr-sr-x 3 build storage 4096 Jul 20 10:50 ..
>     [build@yoctoBuilder temp]$
> 
> Any ideas?

I think its a race since the task writes out logfiles into temp/ and the
command tries to remove all the files. Locally here, it seems to manage
to remove leaving the logfile. I'm puzzled why you see that and I don't
though...

Cheers,

Richard



