Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 6CDD1734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 08:44:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id BDF11608F40
To: openembedded-core@lists.openembedded.org
References: <19f46bb2f6951eca80f159b612b407e3df0b6ea1.1440454290.git.chris_larson@mentor.com>
	<3843d76235f7517207f9aa178d70c731f2b2d51e.1440454290.git.chris_larson@mentor.com>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <55DD7C88.4080305@collabora.co.uk>
Date: Wed, 26 Aug 2015 09:44:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <3843d76235f7517207f9aa178d70c731f2b2d51e.1440454290.git.chris_larson@mentor.com>
Subject: Re: [PATCH 2/3] insane.bbclass: add host-user-contaminated test
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
X-List-Received-Date: Wed, 26 Aug 2015 08:45:01 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 24/08/15 23:19, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> - Add a test which checks for any paths outside of /home which are owned by
>    the user running bitbake.
> - Add the test to WARN_QA by default.

I do all of my builds on a separate partition in a directory hierarchy 
which is owned by my user - if I'm understanding this correctly I'll get 
QA WARNINGS for all of my builds with this change?

It would be nice to be able to bless my build directory and still 
benefit from this check.

Regards,

Joshua

> This test has been in meta-mentor for some time, and in our ERROR_QA for our
> builds, and has caught a number of issues for us.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>   meta/classes/insane.bbclass | 32 ++++++++++++++++++++++++++++++--
>   1 file changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index cd773b7..aec9800 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -31,14 +31,14 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
>               installed-vs-shipped compile-host-path install-host-path \
>               pn-overrides infodir build-deps file-rdeps \
>               unknown-configure-option symlink-to-sysroot multilib \
> -            invalid-pkgconfig \
> +            invalid-pkgconfig host-user-contaminated \
>               "
>   ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>               perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
>               split-strip packages-list pkgv-undefined var-undefined \
>               version-going-backwards expanded-d \
>               "
> -FAKEROOT_QA = ""
> +FAKEROOT_QA = "host-user-contaminated"
>   FAKEROOT_QA[doc] = "QA tests which need to run under fakeroot. If any \
>   enabled tests are listed here, the do_package_qa task will run under fakeroot."
>
> @@ -950,6 +950,34 @@ def package_qa_check_expanded_d(path,name,d,elf,messages):
>                           sane = False
>       return sane
>
> +HOST_USER_UID := "${@os.getuid()}"
> +HOST_USER_GID := "${@os.getgid()}"
> +
> +QAPATHTEST[host-user-contaminated] = "package_qa_check_host_user"
> +def package_qa_check_host_user(path, name, d, elf, messages):
> +    """Check for paths outside of /home which are owned by the user running bitbake."""
> +
> +    if not os.path.lexists(path):
> +        return
> +
> +    check_uid = int(d.getVar('HOST_USER_UID', True))
> +    check_gid = int(d.getVar('HOST_USER_GID', True))
> +
> +    dest = d.getVar('PKGDEST', True)
> +    home = os.path.join(dest, 'home')
> +    if path == home or path.startswith(home + os.sep):
> +        return
> +
> +    stat = os.lstat(path)
> +    if stat.st_uid == check_uid:
> +        messages["host-user-contaminated"] = "%s is owned by uid %d, which is the same as the user running bitbake. This may be due to host contamination" % (path, check_uid)
> +        return False
> +
> +    if stat.st_gid == check_gid:
> +        messages["host-user-contaminated"] = "%s is owned by gid %d, which is the same as the user running bitbake. This may be due to host contamination" % (path, check_gid)
> +        return False
> +    return True
> +
>   # The PACKAGE FUNC to scan each package
>   python do_package_qa () {
>       import subprocess
>


