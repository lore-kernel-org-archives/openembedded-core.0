Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7A4A579C23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 08:38:14 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9M8c9MK012252
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 22 Oct 2018 09:38:11 +0100
Message-ID: <7d241d4a795b1bfbfd15da327420a4d98f0d9223.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 09:38:09 +0100
In-Reply-To: <1540191264-12332-3-git-send-email-ee.peng.yeoh@intel.com>
References: <1540191264-12332-1-git-send-email-ee.peng.yeoh@intel.com>
	<1540191264-12332-3-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 3/4] testimage.bbclass: write testresult to json files
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
X-List-Received-Date: Mon, 22 Oct 2018 08:38:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-10-22 at 14:54 +0800, Yeoh Ee Peng wrote:
> As part of the solution to replace Testopia to store testresult,
> OEQA testimage need to output testresult into json files, where
> these json testresult files will be stored into git repository
> by the future test-case-management tools.
> 
> To configure multiple instances of bitbake to write json testresult
> to a single testresult file, user will define the variable
> "OEQA_JSON_RESULT_COMMON_DIR" with the common directory for writing
> json testresult.
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>  meta/classes/testimage.bbclass | 34 ++++++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
> index 2642a72..112ba71 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -2,7 +2,7 @@
>  #
>  # Released under the MIT license (see COPYING.MIT)
>  
> -
> +inherit metadata_scm
>  # testimage.bbclass enables testing of qemu images using python unittests.
>  # Most of the tests are commands run on target image over ssh.
>  # To use it add testimage to global inherit and call your target image with -c testimage
> @@ -141,6 +141,33 @@ def testimage_sanity(d):
>          bb.fatal('When TEST_TARGET is set to "simpleremote" '
>                   'TEST_TARGET_IP and TEST_SERVER_IP are needed too.')
>  
> +def _get_configuration(d, test_type, pid, machine):
> +    import platform
> +    bb_core_dir = d.getVar("BBFILE_PATTERN_core=")
> +    return {'TEST_TYPE': test_type,
> +            'BRANCH': base_get_metadata_git_branch(bb_core_dir, None).strip(),
> +            'COMMIT': base_get_metadata_git_revision(bb_core_dir, None),

We need to record all the revisions/branches that are being used. Could
we just inject the contents of metadata['layers'] directly into the
json file here?

> +            'PROCESS_ID': pid,
> +            'MACHINE': machine,
> +            'IMAGE_BASENAME': d.getVar("IMAGE_BASENAME"),
> +            'IMAGE_PKGTYPE': d.getVar("IMAGE_PKGTYPE"),
> +            'HOST_DISTRO': platform.linux_distribution()}
> +
> +def _get_json_result_dir(d, configuration):
> +    json_result_dir = os.path.join(d.getVar("WORKDIR"),
> +                                   'temp',
> +                                   'json_testresults-%s' % configuration['PROCESS_ID'],
> +                                   configuration['TEST_TYPE'],
> +                                   configuration['MACHINE'],
> +                                   configuration['IMAGE_BASENAME'])
> +    oeqa_json_result_common_dir = d.getVar("OEQA_JSON_RESULT_COMMON_DIR")
> +    if oeqa_json_result_common_dir:
> +        json_result_dir = oeqa_json_result_common_dir

Do we need both codepaths here or can we just place things in
OEQA_JSON_RESULT_COMMON_DIR unconditionally here?

(we could rename it to OEQA_JSON_RESULT_DIR?)

Cheers,

Richard


