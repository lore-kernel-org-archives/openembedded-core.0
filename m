Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BE6597750C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 16:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21GB3BD012841 for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Mar 2017 16:11:03 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id i36Wvdyiv4LE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 16:11:03 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21GB1hB012837
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Mar 2017 16:11:02 GMT
Message-ID: <1488384661.24526.41.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 01 Mar 2017 16:11:01 +0000
In-Reply-To: <1488384162-18397-2-git-send-email-richard.purdie@linuxfoundation.org>
References: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1488384162-18397-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 02/12] testsdk: Handle minimal eSDK and avoid download costs
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
X-List-Received-Date: Wed, 01 Mar 2017 16:11:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Sorry I missed this one when fixing the patches, I'll add a commit
message which says:

"""
When using a minimal eSDK, testing currently fails as the sdk isn't
populated. We therefore setup the eSDK under test to point at local
sstate and execute a command to ensure the toolchain is populated
since most of the tests depend on this being present.

At the same time, add in a link to DL_DIR through own-mirrors so
that tests which fetch source (e.g. the kernel module one) can use the
local stash. This cuts test execution of the kernel module test from
2000s to 120s.

We did try using DL_DIR directly but that causes uninative issues
requiring other workarounds so own-mirrors is neater.

Together these fixes unbreak eSDK testing on the autobuilder.
"""

On Wed, 2017-03-01 at 16:02 +0000, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/testsdk.bbclass | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/meta/classes/testsdk.bbclass
> b/meta/classes/testsdk.bbclass
> index 75b4027..802e57f 100644
> --- a/meta/classes/testsdk.bbclass
> +++ b/meta/classes/testsdk.bbclass
> @@ -149,6 +149,17 @@ def testsdkext_main(d):
>          bb.plain("Extensible SDK testing environment: %s" % s)
>  
>          sdk_env = sdk_envs[s]
> +
> +        # Use our own SSTATE_DIR and DL_DIR so that updates to the
> eSDK come from our sstate cache
> +        # and we don't spend hours downloading kernels for the
> kernel module test
> +        with open(os.path.join(sdk_dir, 'conf', 'local.conf'), 'a+')
> as f:
> +            f.write('SSTATE_MIRRORS = "file://.* file://%s/PATH"\n'
> % test_data.get('SSTATE_DIR'))
> +            f.write('SOURCE_MIRROR_URL = "file://%s"\n' %
> test_data.get('DL_DIR'))
> +            f.write('INHERIT += "own-mirrors"')
> +
> +        # We need to do this in case we have a minimal SDK
> +        subprocess.check_output(". %s > /dev/null; devtool sdk-
> install meta-extsdk-toolchain" % sdk_env, cwd=sdk_dir, shell=True)
> +
>          tc = OESDKExtTestContext(td=test_data, logger=logger,
> sdk_dir=sdk_dir,
>              sdk_env=sdk_env,
> target_pkg_manifest=target_pkg_manifest,
>              host_pkg_manifest=host_pkg_manifest)

