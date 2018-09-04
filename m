Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D6C5B74BBC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 10:30:36 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w84AUYpA020629
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 4 Sep 2018 11:30:36 +0100
Message-ID: <a4268dca5b5db6759cce2f089f5065708112082d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paulo Neves <ptsneves@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 04 Sep 2018 11:30:34 +0100
In-Reply-To: <1535651376-25467-4-git-send-email-ptsneves@gmail.com>
References: <1535651376-25467-1-git-send-email-ptsneves@gmail.com>
	<1535651376-25467-4-git-send-email-ptsneves@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [meta-oe][PATCH v2 4/4] testimage: Moved write_image_test_data to testimage bbclass.
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
X-List-Received-Date: Tue, 04 Sep 2018 10:30:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-08-30 at 19:49 +0200, Paulo Neves wrote:
> Previously the write_image_test_data was a rootfs post
> process command. This function ran only when the rootfs
> task was ran. Due to this if a variable was changed
> or added to the datastore that would not trigger the do_rootfs
> task, the variable would never be written into the json
> file. Consequently the do_testimage task was potentially
> unreproduceable and could fail if for some reason this
> variable was then used.
> 
> In this commit we move the recording of the datastore to the
> start of the do_testimage task. The do_testimage
> task then reads this freshly generated json and passes it into
> the normal test machinery. This approach allows for the test
> machinery to still be loosely coupled to bitbake, and thus
> still allows for the tests to be exported and used independently
> from bitbake. The caveat is, if there are datastore changes
> then the bitbake testimage task should be run before the tests
> can be ran independently again.

I'm not sure I agree with this. The test data really should be written
at either rootfs or image generation, not just before the tests are
run.

If you wanted to run the tests independently, after this change you
have no way to generate the data to do that without first running the
tests at least once. That doesn't make sense.

The correct thing to do here is to ensure the write_image_test_data()
function indicates which variables it depends upon and hence reruns
correctly.

Cheers,

Richard

