Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id C63D56E65F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 16:51:43 +0000 (UTC)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.153])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5J00BDP5HFXL80@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2016 11:51:26 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=QyXUC8HyAAAA:8 a=sozttTNsAAAA:8
	a=Q4-j1AaZAAAA:8 a=omDvbwo6IvmZDESr-UUA:9	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 41fae76b; Tue, 12 Apr 2016 16:51:26 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 96854161F9A; Tue,
	12 Apr 2016 12:51:15 -0400 (EDT)
Date: Tue, 12 Apr 2016 12:51:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Bill Randle <william.c.randle@intel.com>
Message-id: <20160412165115.GY16135@denix.org>
References: <1460474541-3625-1-git-send-email-william.c.randle@intel.com>
MIME-version: 1.0
In-reply-to: <1460474541-3625-1-git-send-email-william.c.randle@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package.bbclass: handle links in sorted order
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
X-List-Received-Date: Tue, 12 Apr 2016 16:51:49 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 12, 2016 at 08:22:21AM -0700, Bill Randle wrote:
> When processing links, the directories are processed in unsorted order
> which can result in cases like /var/lock -> /run/lock handled before
> /var/run -> /run throwing an error for /var/run because /run already exists.
> Change the link processing to ensure links are processed in sorted order of
> the destination.

Seems to resolve the issue for me.


> [YOCTO #9430]
> 
> Signed-off-by: Bill Randle <william.c.randle@intel.com>

Reported-by: Denys Dmytriyenko <denys@ti.com>
Tested-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  meta/classes/package.bbclass | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 4452e2f..894b729 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -727,6 +727,7 @@ python fixup_perms () {
>      dvar = d.getVar('PKGD', True)
>  
>      fs_perms_table = {}
> +    fs_link_table = {}
>  
>      # By default all of the standard directories specified in
>      # bitbake.conf will get 0755 root:root.
> @@ -773,24 +774,27 @@ python fixup_perms () {
>                      continue
>                  entry = fs_perms_entry(d.expand(line))
>                  if entry and entry.path:
> -                    fs_perms_table[entry.path] = entry
> +                    if entry.link:
> +                        fs_link_table[entry.link] = entry
> +                    else:
> +                        fs_perms_table[entry.path] = entry
>              f.close()
>  
>      # Debug -- list out in-memory table
>      #for dir in fs_perms_table:
>      #    bb.note("Fixup Perms: %s: %s" % (dir, str(fs_perms_table[dir])))
> +    #for link in fs_link_table:
> +    #    bb.note("Fixup Perms: %s: %s" % (link, str(fs_link_table[link])))
>  
>      # We process links first, so we can go back and fixup directory ownership
>      # for any newly created directories
> -    for dir in fs_perms_table:
> -        if not fs_perms_table[dir].link:
> -            continue
> -
> +    # Process in sorted order so /run gets created before /run/lock, etc.
> +    for link in sorted(fs_link_table):
> +        dir = fs_link_table[link].path
>          origin = dvar + dir
>          if not (cpath.exists(origin) and cpath.isdir(origin) and not cpath.islink(origin)):
>              continue
>  
> -        link = fs_perms_table[dir].link
>          if link[0] == "/":
>              target = dvar + link
>              ptarget = link
> @@ -810,9 +814,6 @@ python fixup_perms () {
>          os.symlink(link, origin)
>  
>      for dir in fs_perms_table:
> -        if fs_perms_table[dir].link:
> -            continue
> -
>          origin = dvar + dir
>          if not (cpath.exists(origin) and cpath.isdir(origin)):
>              continue
> -- 
> 2.5.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

