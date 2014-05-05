Return-Path: <joelf@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by mail.openembedded.org (Postfix) with ESMTP id 1006960D0B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 00:34:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s450YdPG030184;
	Sun, 4 May 2014 19:34:39 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s450Ydjc013689;
	Sun, 4 May 2014 19:34:39 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 4 May 2014 19:34:39 -0500
Received: from [172.22.143.171] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s450YdV7018244;
	Sun, 4 May 2014 19:34:39 -0500
Message-ID: <5366DC9E.1020702@ti.com>
Date: Sun, 4 May 2014 19:34:38 -0500
From: Joel Fernandes <joelf@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Tyler Hall <tylerwhall@gmail.com>
References: <5366A8B5.6020900@ti.com>
	<CAOjnSCb-Fkxs3J_5eycnQ6gpRaoJpbsdP6H9+UVEHRm6kwbd8g@mail.gmail.com>
In-Reply-To: <CAOjnSCb-Fkxs3J_5eycnQ6gpRaoJpbsdP6H9+UVEHRm6kwbd8g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Quick question about OE-core/bitbake's re-building
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
X-List-Received-Date: Mon, 05 May 2014 00:34:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 05/04/2014 04:52 PM, Tyler Hall wrote:
> On Sun, May 4, 2014 at 4:53 PM, Joel Fernandes <joelf@ti.com
> <mailto:joelf@ti.com>> wrote:
> 
>     How does it figure out when it needs to rebuild a package?
> 
>  
> Bitbake generates hashes for every task that are based on the data that
> will be used when running the task. This includes the body of the task
> function, any variables it references, checksums of required files, and
> hashes of tasks it depends on. This data is stored for each task in
> $BUILDDIR/tmp/stamps. The task will re-run if a matching sigdata file
> does not exist in the stamps directory. You can run bitbake-dumpsig on a
> sigdata file to see what metadata changes will cause the task to rebuild.
> 
>     For example if I modify the file:
>      ../meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
> 
>     Does it track the modification time to know it needs to rebuild
>     "systemd-serialgetty"?
> 
>     Because doing such a modification didn't cause it to rebuild.
> 

Thanks for your reply, that was helpful.

> The modification time won't trigger a rebuild since the contents hash
> the same. Changing the contents of the file should trigger a rebuild,
> though.

Makes sense. That's what I observed.

However one thing, is the updates don't happen if you revert the changes
back to what it used to be in an earlier revision.

For example if I make changes such that task hash is now X
Then I build, and its called r0.0.
Then I make some more changes such that the hash is now Y
And it becomes r0.1.

Then after some more changes, it becomes X. Now instead of rebuilding
and calling it r0.2, the rebuild doesn't happen. I wonder if this is the
right thing, or the updates should continue to roll.

-Joel

