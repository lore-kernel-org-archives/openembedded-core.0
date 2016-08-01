Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 832526FFF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 08:57:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u718vE6W028508
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Aug 2016 01:57:14 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 1 Aug 2016 01:57:13 -0700
To: Seebs <seebs@seebs.net>, oe-core <openembedded-core@lists.openembedded.org>
References: <577B8AA9.5040808@windriver.com>
	<dc216358-8a1f-1490-2fc0-db22f98741c3@windriver.com>
	<579B07F9.9000708@windriver.com>
	<B3108E03-1852-4237-8320-E2BFEC66F9B3@seebs.net>
	<579EE4BB.6070709@windriver.com>
	<F5BAFB71-1FCC-4F9D-999C-5960E8CD7213@seebs.net>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <579F0EE8.3080009@windriver.com>
Date: Mon, 1 Aug 2016 16:57:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <F5BAFB71-1FCC-4F9D-999C-5960E8CD7213@seebs.net>
Subject: Re: About pseudo's chmod
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
X-List-Received-Date: Mon, 01 Aug 2016 08:57:14 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/01/2016 04:42 PM, Seebs wrote:
> On 1 Aug 2016, at 0:57, Robert Yang wrote:
>
>> Sorry, the steps were wrong, they should be:
>> 1) Out of pseudo:
>>    $ umask 0022
>>    $ touch file1
>> 2) Under pseudo:
>>    $ ln file1 file2
>>    $ chmod 777 file2
>>    $ ls -l file1 file2
>>    We can see that both file1 and file2's mode is 0777.
>>    But if we remove file2:
>>    $ rm -f file2
>>    $ ls file1
>>    Now file1's permission is 0755, not 0777 or 0644, it should be 0777 here.
>
> The short answer is: If you aren't tracking a file in pseudo, we don't make
> promises about its behavior. Normally, we don't touch them, but if there's hard
> links to them that are being touched, well. And having a hard link that is
> tracked, and another that isn't, is probably impossible to support. I definitely
> don't want to keep database entries for files that have been deleted, that way
> lies madness and possible database corruption; for instance, if we do that, and
> you make a new file of the same type, it'll show up as having those permissions,
> with only a path-mismatch warning in the database to suggest what went wrong.
>
> I would say that the probable correct answer is either "make the original file
> be tracked" or "don't use hard links in this case".

Hi Peter,

How about we track the src when hardlink, for example:

$ ln oldpath newpath

Track both oldpath and newpath. The patch for pseudo is:

diff --git a/ports/unix/guts/linkat.c b/ports/unix/guts/linkat.c
index ec27e47..521b8fa 100644
--- a/ports/unix/guts/linkat.c
+++ b/ports/unix/guts/linkat.c
@@ -62,6 +62,10 @@
           * if the thing linked is a symlink.
           */
          pseudo_client_op(OP_LINK, 0, -1, -1, newpath, &buf);
+        /*
+         * Track oldpath in case it isn't tracked.
+         */
+        pseudo_client_op(OP_LINK, 0, -1, -1, oldpath, &buf);

          errno = save_errno;

// Robert

>
> Note that, under older pseudo, the file would have ended up 0777. The behavior
> of silently masking out 022 from underlying filesystem permissions is entirely
> intentional. During some debugging quite a while back, we discovered a quirk in
> oe-core, plus a strange behavior of
> GNU tar, which between them resulted in some sstage directories getting
> unpacked with mode 0777.
>
> And we *really* don't want the build system generating files which other users
> can modify, especially not in stuff that's intended to go into a root
> filesystem. So stripping out those bits in the underlying filesystem is
> intentional.
>
> If you were actually root, yes, the original file would have its mode changed to
> 0777. But we should never be *caring* about the mode bits on
> raw files outside of pseudo, except that we want them to allow owner
> write permissions and not allow group or other write permissions. If the
> file's permissions matter to the build system or generated stuff, the
> file should be tracked by pseudo.
>
> -s

