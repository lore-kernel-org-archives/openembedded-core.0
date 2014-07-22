Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 338D76084E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 12:05:53 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 74F6EF811E6; Tue, 22 Jul 2014 06:05:54 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 97386F811E3;
	Tue, 22 Jul 2014 06:05:52 -0600 (MDT)
Message-ID: <53CE53A2.7000608@mlbassoc.com>
Date: Tue, 22 Jul 2014 06:05:54 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1405996037.git.Qi.Chen@windriver.com>
	<3777fcb67381393b494ac5fcb042ba8bc9fa8acb.1405996037.git.Qi.Chen@windriver.com>
In-Reply-To: <3777fcb67381393b494ac5fcb042ba8bc9fa8acb.1405996037.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/1] shadow: fix the behavior of su
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
X-List-Received-Date: Tue, 22 Jul 2014 12:05:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-07-21 20:32, Chen Qi wrote:
> In systems where bash is not installed and /bin/sh is provided by
> busybox. Commands like `su -l -c '/home/root/test' xuser' would fail
> complaining the the 'su' applet could not be found.
>
> This patch references the old version of shadow to keep the behaviour
> the way it was in old version so that we would avoid the problem mentioned
> above.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

Acked-by: Gary Thomas <gary@mlbassoc.com>

> ---
>   .../0001-su.c-fix-to-exec-command-correctly.patch  |   25 ++++++++++++++++++++
>   meta/recipes-extended/shadow/shadow.inc            |    1 +
>   2 files changed, 26 insertions(+)
>   create mode 100644 meta/recipes-extended/shadow/files/0001-su.c-fix-to-exec-command-correctly.patch
>
> diff --git a/meta/recipes-extended/shadow/files/0001-su.c-fix-to-exec-command-correctly.patch b/meta/recipes-extended/shadow/files/0001-su.c-fix-to-exec-command-correctly.patch
> new file mode 100644
> index 0000000..31337de
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/0001-su.c-fix-to-exec-command-correctly.patch
> @@ -0,0 +1,25 @@
> +Upstream-Status: Pending
> +
> +Subject: su.c: fix to exec command correctly
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/su.c |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/su.c b/src/su.c
> +index 3704217..bc4f2ac 100644
> +--- a/src/su.c
> ++++ b/src/su.c
> +@@ -1156,7 +1156,7 @@ int main (int argc, char **argv)
> + 		 * Use the shell and create an argv
> + 		 * with the rest of the command line included.
> + 		 */
> +-		argv[-1] = cp;
> ++		argv[-1] = shellstr;
> + 		execve_shell (shellstr, &argv[-1], environ);
> + 		err = errno;
> + 		(void) fprintf (stderr,
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
> index 66541f4..84d1f86 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -14,6 +14,7 @@ SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.xz \
>              file://shadow-4.1.3-dots-in-usernames.patch \
>              file://usermod-fix-compilation-failure-with-subids-disabled.patch \
>              file://fix-installation-failure-with-subids-disabled.patch \
> +           file://0001-su.c-fix-to-exec-command-correctly.patch \
>              ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
>              "
>
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

