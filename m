Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3E9DA78F7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 14:33:28 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7DEXQcI006250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 13 Aug 2018 15:33:27 +0100
Message-ID: <94fdc59922b11cf74ec789ffbaa4745ca3bc8ead.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paulo Neves <ptsneves@gmail.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Mon, 13 Aug 2018 15:33:26 +0100
In-Reply-To: <CAJO0J4ig3xhEaukBrZFw2RCMzpXjbuXXFiMt8vP2edpsA8Wdxw@mail.gmail.com>
References: <1533929879-22972-1-git-send-email-ptsneves@gmail.com>
	<CAJO0J4ig3xhEaukBrZFw2RCMzpXjbuXXFiMt8vP2edpsA8Wdxw@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [meta-oe][PATCH 1/3] testimage: Refactoring and fixing.
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
X-List-Received-Date: Mon, 13 Aug 2018 14:33:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-08-12 at 21:49 +0200, Paulo Neves wrote:
> I found a bug in my code where changing a variable, for example in
> layer.conf does not re-trigger the generation of the json file
> containing the data store at the time of image creation. The json
> file is generated in
> ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data ; " @
> meta/classes/rootfs-postcommands.bbclass.
> 
> Can anybody tell me if changing a variable in the datastore and
> accessing it in the postprocess_command will never trigger the
> postprocess_command? It happens that in this case this variable is
> not important for the rootfs task itself but only for the post-
> process.

The system has no insight into which variables that command might be
accessing so it doesn't know when to rerun it. Adding a dependency on
all variables would mean the rootfs would get continually rewritten.

I don't like the json usage in testimage for this reason as it
effectively breaks our data dependencies and handling in order to be
able to run standalone. Pros and cons I guess, this is one of the
downsides. Not sure there is much that can be done about it.

Cheers,

Richard



