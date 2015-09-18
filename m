Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob07.myregisteredsite.com
	(atl4mhob07.myregisteredsite.com [209.17.115.45])
	by mail.openembedded.org (Postfix) with ESMTP id 933B877035
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 13:41:49 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.203])
	by atl4mhob07.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t8IDfm19026932 for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 09:41:48 -0400
Received: (qmail 5642 invoked by uid 0); 18 Sep 2015 13:41:48 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO ?192.168.80.121?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 18 Sep 2015 13:41:48 -0000
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20150918115458.GA11095@jama>
	<1442582049-12108-1-git-send-email-Martin.Jansa@gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <55FC149B.80800@topic.nl>
Date: Fri, 18 Sep 2015 15:41:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1442582049-12108-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [PATCH 1/3] insane.bbclass: show PN and relative path in package_qa_check_host_user
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
X-List-Received-Date: Fri, 18 Sep 2015 13:41:51 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 18-09-15 15:14, Martin Jansa wrote:
> * show PN as other QA checks
> * strip PKGDEST prefix from shown path as other QA checks
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/classes/insane.bbclass | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 5c8629a..a35e546 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -980,6 +980,7 @@ def package_qa_check_host_user(path, name, d, elf, messages):
>           return
>
>       dest = d.getVar('PKGDEST', True)
> +    pn = d.getVar('PN', True)
>       home = os.path.join(dest, 'home')
>       if path == home or path.startswith(home + os.sep):
>           return
> @@ -991,14 +992,15 @@ def package_qa_check_host_user(path, name, d, elf, messages):
>           if exc.errno != errno.ENOENT:
>               raise
>       else:
> +        rootfs_path = path[len(dest):]
>           check_uid = int(d.getVar('HOST_USER_UID', True))
>           if stat.st_uid == check_uid:
> -            messages["host-user-contaminated"] = "%s is owned by uid %d, which is the same as the user running bitbake. This may be due to host contamination" % (path, check_uid)
> +            messages["host-user-contaminated"] = "%s: %s is owned by uid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, rootfs_path, check_uid)
>               return False
>
>           check_gid = int(d.getVar('HOST_USER_GID', True))
>           if stat.st_gid == check_gid:
> -            messages["host-user-contaminated"] = "%s is owned by gid %d, which is the same as the user running bitbake. This may be due to host contamination" % (path, check_gid)
> +            messages["host-user-contaminated"] = "$s: %s is owned by gid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, rootfs_path, check_gid)

I think "$s" is a typo (that will lead to a Python exception).

>               return False
>       return True
>
>


