Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yao.Zhao@windriver.com>) id 1StfrR-0000VN-3d
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 16:13:17 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6OE1kCt005049
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Jul 2012 07:01:46 -0700 (PDT)
Received: from [128.224.147.210] (128.224.147.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 24 Jul 2012 07:01:46 -0700
Message-ID: <500EAABE.5070408@windriver.com>
Date: Tue, 24 Jul 2012 10:01:34 -0400
From: Yao Zhao <yao.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343137799-12032-1-git-send-email-yao.zhao@windriver.com>
	<CAJTo0LYuuOvzPSW6g8HSr8_6bPHgP8A0jD5Rb3wbRneNEkdUQg@mail.gmail.com>
In-Reply-To: <CAJTo0LYuuOvzPSW6g8HSr8_6bPHgP8A0jD5Rb3wbRneNEkdUQg@mail.gmail.com>
X-Originating-IP: [128.224.147.210]
Subject: Re: [PATCH] bzip2-native: fix problems when bzip2-native is installed in parallel
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
X-List-Received-Date: Tue, 24 Jul 2012 14:13:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-07-24 09:57 AM, Burton, Ross wrote:
> On 24 July 2012 14:49, Yao Zhao <yao.zhao@windriver.com> wrote:
>> when bzip2-native is installed in parallel to sysroot, it is possible that
>> some packages are using bzip2 to unpack, there are chances that bzip2 is
>> installed to sysroot but libbz2.so.0 not installed yet because parallel
>> installation.
>> link bzip2 and bzip2recover statically to avoid this problem and don't lose
>> parallel installation. libbz2.so is still available.
> Is it me, or is this officially getting silly?  This probably happens
> for *every* binary in the sysroot that links to a library, which is
> probably a fair proportion of them.  Statically linking every single
> one and then special-casing further problems where a static link isn't
> sufficient (see pythonnative) just isn't going to scale.
HI Ross,

I agree.
I sent a discussion to openembedded-devel@lists.openembedded.org, 
probably I sent to a wrong list.

Can you give any suggestion or we need a whole solution for all those 
native binaries?

yao
Just forward here:

Hi all,

Got a problem about bzip2-native:

The reason is that when unpacking xextproto-7.2.0.tar.bz2, 
bzip2-native's build is triggered too because of another package's 
dependency. And loader can't find libbz2.so.0 which is in sysroot(host 
bzip2 used libbz2.so.1 so it is sure the libbz2.so.0 in sysroot) I have 
searched the paths in PATH below and only find bzip2 in 2 places: host 
/bin/bzip2 and sysroot bzip2.

In bzip2's Makefile, the install is make -j xxx ... although the install 
is first to install libbz2.so.0 then bzip2 but because of the "-j xxx" 
so it is possible that bzip2 is installed first but libbz2.so.0 is not 
ready yet(in a subshell this link is created).
So I have to make the install atomic or at least don't install in parallel.

so there are a couple of workarounds:
1.set PARALLEL_MAKEINST="" (one line change, and only one library, 2 
binaries installed(bzip2, bzip2recover) + 3 scripts + a couple of links)
2.make a statically linked bzip2 and bzip2recover
3.like perl or python native to make a bzip2-native subdir in sysroot 
then only packages explicitly inherit bzip2native which will set the path.

I need your advice!

thanks,
yao
> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




