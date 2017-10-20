Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7A66E688
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Oct 2017 22:07:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9KM7JCM019131
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Oct 2017 15:07:21 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 20 Oct 2017 15:07:18 -0700
To: Konrad Scherer <Konrad.Scherer@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <c9dc44be-45fc-71b7-c488-d7b02e8beebf@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <7202c981-ed88-48ac-6281-d8e7d50a409a@windriver.com>
Date: Fri, 20 Oct 2017 18:07:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <c9dc44be-45fc-71b7-c488-d7b02e8beebf@windriver.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: Wind River Continuous Integration project
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
X-List-Received-Date: Fri, 20 Oct 2017 22:07:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-10-20 02:18 PM, Konrad Scherer wrote:
> 
> One of the common challenges of Yocto development is the setup and 
> maintenance of a build cluster. If only there was a generic open source 
> Yocto continuous integration project to make the setup and maintenance 
> of build clusters easy...
> 
> I have a working prototype and it's on GitHub.
> 
> https://github.com/WindRiver-OpenSourceLabs/ci-scripts
> 
> It is a set of scripts and docker images for building Yocto images using 
> Jenkins and Docker. There are three main features that I think you will 
> find interesting:

Konrad and I work together so my comments here might be biased. :)

I haven't been involved in the ci-scripts project until I tried
it out yesterday. Without Konrad's guidance, I was able to
install the system and run a core-image-minimal build. The
set-up took ~ 10 minutes of my time including reading some of
the Docker docs, installing packages, then it was another 10-15
mintues of downloading the images and so on on my slow network.

I ran it out on an old core2, 4 GB RAM, with one of those old,
slow, spinning magnetic disks  on a slowish network. A build
in the ubuntu container in docker finished in the same as
a native build:
   3hr 22min for core-image-minimal, poky/pyro.
Such slow hardware!

Btw, I recently got a Google Compute Platform (GCP) offer of
$300 worth of GCP time. I set-up a reasonable VM and on that
Haswell, 4 core system a build of core-image-minimal took
about 60 minutes and finally for comparison sake on our
128 vCore system, core-image-minimal takes ~ 30 minutes.

The cost for the build was 62 cents:

Resource               Usaged           Amount
Custom instance Core   658.42 Minute    $0.45
Custom instance Ram     21.95 GiB-hour  $0.12
Storage PD Capacity    959.78 GiB-day   $0.05

so a 10 node cluster running developer builds would be:
   $ 148/day
   $ 54K/year

There would of course be ways to reduce this cost using
sstate, ccache, etc.

I plan to set-up a cluster to test docker swarm at some
point.




> 1) Multi-host builds using Docker Swarm. This provides an easy way to
> scale the build cluster from one to tens of machines. Docker Swarm makes 
> this surprisingly simple.

The setup was pretty straight-forward for the single-host mode.

I'm using Fedora 26. It did require following the docker links
and making some decisions about how to install docker.
I went with adding the Docker CE rpm feed to my system
and then using the horrid curl-fetches-a-script approach
for Docker Compose.

Konrad, any idea why the Docker team doesn't have an rpm feed for
Docker Compose?

> 
> 2) Developer builds. This enables build testing of patches before they
> are committed to the main branches. It leverages the WR setup[1]
> program and a temporary layerindex to assemble a custom project that
> matches the developer's local project.

I haven't done that yet but
we have used this feature in our previous system at WR and it really
helps a team test their work when they can dispatch 10s of builds
for various configurations across the network. I'm sure that
many people in the community would like to be able to do the same
thing if we can figure out how to make the hardware available
without blowing the YP/LF budget!

> 
> 3) Toaster integration. A simple UI to dynamically expose the Toaster
> interface of all in progress builds.

I haven't done this yet.

> 
> We are deploying this internally at Wind River and I hope that the 
> oe-core community will be interested in collaborating on its development.
> 
> Please have a look and give it a try. All feedback welcome!

I spoke with Konrad and he needs to change a default so
that builds aren't removed:
   https://github.com/WindRiver-OpenSourceLabs/ci-scripts/issues/1
I guess I could fix that myself but it's the weekend now.


Looks like a good start to me.

../Randy

> 
> [1]: https://github.com/Wind-River/wr-lx-setup
> 


-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

