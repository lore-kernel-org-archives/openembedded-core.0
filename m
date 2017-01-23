Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EE3F27665F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 16:48:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0NGmSVY021455
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 08:48:28 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 23 Jan 2017 08:48:27 -0800
To: Paul Gortmaker <paul.gortmaker@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <20170123164454.GT29778@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <25726cb2-3125-5ad5-e69a-9ae4269fed53@windriver.com>
Date: Mon, 23 Jan 2017 10:48:26 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170123164454.GT29778@windriver.com>
Subject: Re: do_populate_sysroot: Function failed: relocatable_binaries_preprocess
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
X-List-Received-Date: Mon, 23 Jan 2017 16:48:29 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 1/23/17 10:44 AM, Paul Gortmaker wrote:
> After updating this morning (everything on master, re-using the existing
> build dir that was built OK within the last 48h) I saw this:
> 
> ERROR: pseudo-native-1.8.1-r0 do_populate_sysroot: pseudo-native: chrpath command failed with exit code 7:
> b'/home/paul/poky/build/tmp/work/x86_64-linux/pseudo-native/1.8.1-r0/sysroot-destdir/home/paul/poky/build/tmp/work/x86_64-linux/pseudo-native/1.8.1-r0/recipe-sysroot-native/usr/bin/pseudodb:
> RPATH=/home/paul/poky/build/tmp/sysroots/x86_64-linux/usr/lib:/home/paul/poky/build/tmp/sysroots/x86_64-linux/lib\n'b"new
> rpath
> '$ORIGIN/../../../../../../../sysroots/x86_64-linux/usr/lib:$ORIGIN/../../../../../../../sysroots/x86_64-linux/lib' too large; maximum length 107\n"
> ERROR: pseudo-native-1.8.1-r0 do_populate_sysroot: Function failed: relocatable_binaries_preprocess
> ERROR: Logfile of failure stored in: /home/paul/poky/build/tmp/work/x86_64-linux/pseudo-native/1.8.1-r0/temp/log.do_populate_sysroot.11

Looking at it, the error from chrpath is easy to explain.  The original RPATH
value is shorted then the new RPATH value that was calculated.

i.e.:
/home/paul/poky/build/tmp/sysroots/x86_64-linux/usr/lib

vs

$ORIGIN/../../../../../../../sysroots/x86_64-linux/usr/lib

So the system errors because it would overflow the buffer inside of the ELF object.

What is strange is this issue is new.  It means something has changed in the
origin processing of native packages over the weekend.

I'm wondering if this has something to do with the new recipe specific sysroot.

It should hopefully be easy to _workaround_ this issue, by having the build
directory in a deeper path  (something with more characters in it.)

But this is a big enough program we're going to have to figure out how to solve it.

--Mark

> I did a cleansstate on that and then it was fine but then openssl died
> in the same way:
> 
> ERROR: openssl-native-1.0.2j-r0 do_populate_sysroot: openssl-native: chrpath command failed with exit code 7:
> b'/home/paul/poky/build/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/sysroot-destdir/home/paul/poky/build/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/recipe-sysroot-native/usr/lib/libssl.so.1.0.0: RPATH=/home/paul/poky/build/tmp/sysroots/x86_64-linux/usr/lib:/home/paul/poky/build/tmp/sysroots/x86_64-linux/lib\n'b"new rpath '$ORIGIN/../../../../../../../sysroots/x86_64-linux/usr/lib:$ORIGIN/../../../../../../../sysroots/x86_64-linux/lib' too large; maximum length 107\n"
> ERROR: openssl-native-1.0.2j-r0 do_populate_sysroot: Function failed: relocatable_binaries_preprocess
> ERROR: Logfile of failure stored in: /home/paul/poky/build/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/temp/log.do_populate_sysroot.7182
> ERROR: Task (virtual:native:/home/paul/poky/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb:do_populate_sysroot) failed with exit code '1'
> 
> I mentioned it to Mark and he suggested I should mention it here.
> 
> P.
> 
> 


