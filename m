Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 97C14782C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 14:24:21 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7OEOJ16025669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 24 Aug 2017 15:24:20 +0100
Message-ID: <1503584659.32591.196.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tobias Hagelborn <tobias.hagelborn@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 24 Aug 2017 15:24:19 +0100
In-Reply-To: <1503584034-20032-2-git-send-email-tobiasha@axis.com>
References: <1503584034-20032-1-git-send-email-tobiasha@axis.com>
	<1503584034-20032-2-git-send-email-tobiasha@axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 24 Aug 2017 15:24:21 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Tobias Hagelborn <tobiasha@axis.com>
Subject: Re: [PATCH v4 1/2] package.py: strip_execs: Support for .ko modules
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
X-List-Received-Date: Thu, 24 Aug 2017 14:24:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-08-24 at 16:13 +0200, Tobias Hagelborn wrote:
> * Support stripping of .ko modules verifying file extension and
>   check of content "vermagic="
> * Minor refactoring (removing lint errors)

Please don't do this. If you want to do "lint" cleanups please do it in
a separate patch. I can't decide if some of the cleanup is just that or
there was a real bug you were fixing.

I'm also a little worried about the overhead of mmaping all files and
then doing text searches on them. Could we avoid that unless its a
"*.ko" file?

I'm also not convinced:

-    libdir = os.path.abspath(dstdir + os.sep + libdir)
+    libdir = os.path.abspath(os.path.join(dstdir, libdir.lstrip(os.sep)))

is an improvement...


>                  # It's a file (or hardlink), not a link
>                  # ...but is it ELF, and is it already stripped?
> -                elf_file = isELF(file)
> +                elf_file = is_elf(file)
>                  if elf_file & 1:
>                      if elf_file & 2:
>                          if qa_already_stripped:
> @@ -132,6 +138,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir,
> base_libdir, qa_already_stripped=
>                          os.unlink(file)
>                          os.link(inodes[s.st_ino], file)
>                      else:
> +                        # break hardlinks so that we do not strip
> the original.
>                          inodes[s.st_ino] = file
>                          # break hardlink

Might as well delete the now unneeded second comment?

Cheers,

Richard

