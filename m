Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RxpSj-0003Sg-Jc
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Feb 2012 01:44:41 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1G0aRj1028928
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2012 16:36:27 -0800 (PST)
Received: from Macintosh-5.local (147.11.116.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 15 Feb 2012 16:36:27 -0800
Message-ID: <4F3C4F8B.30706@windriver.com>
Date: Wed, 15 Feb 2012 16:36:27 -0800
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CA+b4E8wdD1bQN77Sg=ew+-AbHtyrn4N87Ud6+BwCFdW56BO_kQ@mail.gmail.com>
In-Reply-To: <CA+b4E8wdD1bQN77Sg=ew+-AbHtyrn4N87Ud6+BwCFdW56BO_kQ@mail.gmail.com>
Subject: Re: Problem building core-image-basic: Cannot create symlink from ./var/run to 'volatile/run'
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
X-List-Received-Date: Thu, 16 Feb 2012 00:44:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/15/12 3:21 PM, Brandon Stafford wrote:
> Hi all,
>
> In trying to build core-image-basic for qemuarm, I ran into an error:
> extract_archive: Cannot create symlink from ./var/run to 'volatile/run': File
> exists.
>
> (The full error message is posted here: http://pastebin.com/QPic3uHx )
>
> Though this seems very similar to a post from a few months ago, I am not sure
> how to go about debugging it:
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035409.html
>
> Can other folks build core-image-basic successfully? Any suggestions about how
> to determine which recipe is attempting to make the symlink?
>
>  From what I can tell, the culprits could be meta/files/fs-perms.txt or
> meta/recipes-core/base-files/base-files_3.0.14.bb <http://base-files_3.0.14.bb>,
> but I'm not sure where to go from there. If it helps, I am able to build
> core-image-minimal successfully.

The issue is most likely that something created the directory of "/var/run", and 
then the later base-files attempted to create the symlink which caused the failure.

i.e. package foo created something like:

/var/run/foo

and then base-files attempts:

ln -s var/run volatile/run

and then you see the failure.


The fs-perm.txt file is supposed to prevent this situation from happening. 
During the package generation, fs-perms should be checking that a directory 
/var/run was never generated, and if it was, should be moving the files to 
volatine/run.

fs-perms is used by package.bbclass, the "fixup_perms" function does the 
expected changes.

In order to debug this, I'd first figure out which package has a /var/run 
directory in it, and then verify that it's reproducible by rebuilding that 
package.  (Hopefully it is!)

I'd then suggest that you go through that function and remove the commend from 
the "bb.note" calls.  This should give you a clue if the fixup code is running 
and what it's trying to do.

This is the code that -should- be doing the fixup:

                 # Create path to move directory to, move it, and then setup the$
                 bb.mkdirhier(os.path.dirname(target))
                 #bb.note("Fixup Perms: Rename %s -> %s" % (dir, ptarget))
                 os.rename(origin, target)
                 #bb.note("Fixup Perms: Link %s -> %s" % (dir, link))
                 os.symlink(link, origin)

I hope this helps figure out what went wrong.

--Mark

> Thanks,
> Brandon
>
> --
> Brandon Stafford
> Rascal Micro: small computers for art and science
> Somerville, MA, USA
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



