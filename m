Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F187879EB4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 08:32:41 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wA88WcfN015080
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 8 Nov 2018 08:32:39 GMT
Message-ID: <ce512328cae84cc48d77dc907b54fb3f452f7f3d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 08 Nov 2018 08:32:38 +0000
In-Reply-To: <1541664141-55191-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1541664141-55191-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] oeqa/runtime: Add tests for gstreamer CLI
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
X-List-Received-Date: Thu, 08 Nov 2018 08:32:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-11-08 at 16:02 +0800, Yeoh Ee Peng wrote:
> We should not be finding GStreamer issues right around
> release time but that's what we seem to do.
> 
> Port gstreamer tests from Intel Ref Kit.
> https://github.com/intel/intel-iot-refkit/blob/master/meta-iotqa/
> lib/oeqa/runtime/multimedia/gstreamer/gstreamer_cli.py
> 
> Add tests for gstreamer commandline tools (gst-inspect-1.0
> & gst-launch-1.0).
> 
> [YOCTO #11418]
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>  meta/lib/oeqa/runtime/cases/gstreamer.py | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta/lib/oeqa/runtime/cases/gstreamer.py
> 
> diff --git a/meta/lib/oeqa/runtime/cases/gstreamer.py
> b/meta/lib/oeqa/runtime/cases/gstreamer.py
> new file mode 100644
> index 0000000..3adeeb5
> --- /dev/null
> +++ b/meta/lib/oeqa/runtime/cases/gstreamer.py
> @@ -0,0 +1,11 @@
> +from oeqa.runtime.case import OERuntimeTestCase
> +
> +class GstreamerCliTest(OERuntimeTestCase):
> +
> +    def test_gst_inspect_can_list_all_plugins(self):
> +        status, output = self.target.run('gst-inspect-1.0')
> +        self.assertEqual(status, 0, 'gst-inspect-1.0 does not appear
> to be running.')
> +
> +    def test_gst_launch_can_create_video_pipeline(self):
> +        status, output = self.target.run('gst-launch-1.0 -v fakesrc
> silent=false num-buffers=3 ! fakesink silent=false')
> +        self.assertEqual(status, 0, 'gst-launch-1.0 does not appear
> to be running.')

This looks good and I like the idea of this a lot but I think it needs
some kind of:

@OEHasPackage(['<somepackage>'])

decorator so we know where the test needs to run?

Cheers,

Richard


